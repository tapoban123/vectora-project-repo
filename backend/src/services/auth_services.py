from datetime import timedelta, datetime, timezone

import jwt
from fastapi import HTTPException, status
from jwt import InvalidTokenError
import firebase_admin
from firebase_admin import credentials
from firebase_admin import auth

from src.core.constants import JWT_SECRET_KEY, JWT_HASH_ALGORITHM, EXPIRE_MINUTES_ACCESS_TOKEN, \
    EXPIRE_DAYS_REFRESH_TOKEN
from src.schemas.auth_schemas import UserProfileDetailsSchema, AuthTokensSchema

cred = credentials.Certificate("vectora-firebase-private-key.json")
firebase_admin.initialize_app(cred)

SECRET_KEY = JWT_SECRET_KEY
ALGORITHM = JWT_HASH_ALGORITHM
ACCESS_TOKEN_EXPIRE_MINUTES = int(EXPIRE_MINUTES_ACCESS_TOKEN)
REFRESH_TOKEN_EXPIRE_DAYS = int(EXPIRE_DAYS_REFRESH_TOKEN)


def sign_in_user_service(token: str):
    try:
        claims = auth.verify_id_token(token)
        user_details: UserProfileDetailsSchema = UserProfileDetailsSchema.model_validate(claims)
        refresh_token = generate_jwt_token(user_details.internal_id,
                                           expires_delta=timedelta(days=REFRESH_TOKEN_EXPIRE_DAYS))
        access_token = generate_jwt_token(user_details.internal_id,
                                          expires_delta=timedelta(days=ACCESS_TOKEN_EXPIRE_MINUTES))
        return AuthTokensSchema(access_token=access_token, refresh_token=refresh_token)

    except ValueError as e:
        print(f"Invalid Token: {e}")
        raise HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_CONTENT, detail=e)
    except auth.InvalidIdTokenError as e:
        print(f"Token verification failed:{e}")
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e)


def generate_jwt_token(internal_uid: str, expires_delta: timedelta):
    payload: dict = {"uid": internal_uid}
    issued_at = datetime.now(tz=timezone.utc)
    expire = issued_at + expires_delta
    payload.update({"iat": issued_at, "exp": expire})
    encoded_jwt = jwt.encode(algorithm=ALGORITHM, payload=payload, key=SECRET_KEY)
    return encoded_jwt


def validate_jwt_token(token: str):
    pass
