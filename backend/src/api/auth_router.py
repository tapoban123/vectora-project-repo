from typing import Annotated

from fastapi import APIRouter
from fastapi.params import Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

from src.schemas.auth_schemas import AccessTokenSchema
from src.services.auth_services import sign_in_user_service, validate_id_token_and_generate_access_key

auth_router = APIRouter(prefix="/auth", tags=["Authentication"])

security = HTTPBearer()


@auth_router.get("/sign-in", response_model=AccessTokenSchema)
def sign_in_user(
        credentials: Annotated[HTTPAuthorizationCredentials, Depends(security)],
):
    return sign_in_user_service(token=credentials.credentials)


@auth_router.get("/access-token/generate", response_model=AccessTokenSchema)
def generate_new_access_token(id_token: Annotated[HTTPAuthorizationCredentials, Depends(security)]):
    access_token = validate_id_token_and_generate_access_key(token=id_token.credentials)
    return {"access_token": access_token}
