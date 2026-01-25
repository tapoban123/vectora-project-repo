from typing import Annotated

from fastapi import APIRouter, HTTPException
from fastapi.params import Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

from src.schemas.auth_schemas import UserProfileDetailsSchema, AuthTokensSchema
from src.services.auth_services import sign_in_user_service

auth_router = APIRouter(prefix="/auth", tags=["Authentication"])

security = HTTPBearer()


@auth_router.get("/sign-in", response_model=AuthTokensSchema)
def sign_in_user(credentials: Annotated[HTTPAuthorizationCredentials, Depends(security)]):
    return sign_in_user_service(token=credentials.credentials)
