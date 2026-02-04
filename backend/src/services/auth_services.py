from datetime import timedelta, datetime, timezone
import jwt
from jwt.exceptions import PyJWTError, ExpiredSignatureError
import firebase_admin
from firebase_admin import credentials
from firebase_admin import auth

from src.core.logger import logger
from src.core.secrets import (
    JWT_SECRET_KEY,
    JWT_HASH_ALGORITHM,
    EXPIRE_MINUTES_ACCESS_TOKEN,
    FIREBASE_PRIVATE_KEY,
)
from src.exceptions import InvalidIdTokenException, UserSignInException, \
    InvalidAccessTokenException, ExpiredAccessTokenException
from src.models.user_model import UserProfileDataModel
from src.repositories.user_auth_repository import UserAuthRepository
from src.schemas.auth_schemas import UserProfileDetailsSchema

cred = credentials.Certificate(FIREBASE_PRIVATE_KEY)
firebase_admin.initialize_app(cred)

SECRET_KEY = JWT_SECRET_KEY
ALGORITHM = JWT_HASH_ALGORITHM
ACCESS_TOKEN_EXPIRE_MINUTES = int(EXPIRE_MINUTES_ACCESS_TOKEN)


def sign_in_user_service(token: str):
    """Verifies firebase id token received from client.
    If id token is valid,
     - Stores user data to dynamodb if not exists already.
     - Generates and returns access key.
     Else, raise 401 error"""
    try:
        claims = auth.verify_id_token(token, clock_skew_seconds=5)
        user_details: UserProfileDetailsSchema = (
            UserProfileDetailsSchema.model_validate(claims)
        )

        auth_repo = UserAuthRepository()
        user = auth_repo.get_user(user_id=user_details.user_id, created_at=user_details.created_at)

        if not user:
            new_user = UserProfileDataModel.model_validate(user_details.model_dump())
            auth_repo.create_user(new_user)

        access_token = generate_jwt_token(
            user_details.internal_id,
            expires_delta=timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES),
        )
        return {"access_token": access_token}

    except auth.InvalidIdTokenError as e:
        logger.error("Token verification failed: %s", str(e))
        raise InvalidIdTokenException()
    except Exception as e:
        logger.error("Sign In Failed: %s", str(e))
        raise UserSignInException()


def generate_jwt_token(internal_uid: str, expires_delta: timedelta):
    """Generates and return a JWT token with uid, issued_at and expiration as payload."""
    payload: dict = {"uid": internal_uid}
    issued_at = datetime.now(tz=timezone.utc)
    expire = issued_at + expires_delta
    payload.update({"iat": issued_at, "exp": expire})
    encoded_jwt = jwt.encode(algorithm=ALGORITHM, payload=payload, key=SECRET_KEY)
    return encoded_jwt


def validate_id_token_and_generate_access_key(token: str):
    """Validates the client id token
     If id token is valid, generates and returns new access token.
     Else, raises 401 error."""
    try:
        claims = auth.verify_id_token(id_token=token, clock_skew_seconds=5)
        user_details: UserProfileDetailsSchema = UserProfileDetailsSchema.model_validate(claims)
        access_token: str = generate_jwt_token(internal_uid=user_details.internal_id,
                                               expires_delta=timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES))
        return access_token
    except auth.InvalidIdTokenError:
        raise InvalidIdTokenException()


def validate_access_token(token: str):
    """Validates the client access token
    If token is valid, returns uid.
    Else, raises 401 error."""
    try:
        payload = jwt.decode(token, key=JWT_SECRET_KEY, algorithms=[ALGORITHM])
        if payload:
            return payload["uid"]
        raise InvalidAccessTokenException()
    except ExpiredSignatureError:
        raise ExpiredAccessTokenException()
    except PyJWTError:
        raise InvalidAccessTokenException()
