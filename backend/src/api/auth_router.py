from typing import Annotated

from fastapi import APIRouter
from fastapi.params import Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

from src.core.security import get_user_dep
from src.schemas.auth_schemas import AccessTokenSchema
from src.services.auth_services import sign_in_user_service, validate_id_token_and_generate_access_key, \
    start_deletion_user

auth_router = APIRouter(prefix="/auth", tags=["Authentication"])

security = HTTPBearer()


@auth_router.get("/sign-in", response_model=AccessTokenSchema)
def sign_in_user(
        credentials: Annotated[HTTPAuthorizationCredentials, Depends(security)],
):
    return sign_in_user_service(token=credentials.credentials)


@auth_router.delete("/delete")
def delete_user(current_user_id: Annotated[str, Depends(get_user_dep)]):
    """Updates the user to get deleted after 30 days."""
    return start_deletion_user(user_id=current_user_id)


@auth_router.get("/access-token/generate", response_model=AccessTokenSchema)
def generate_new_access_token(id_token: Annotated[HTTPAuthorizationCredentials, Depends(security)]):
    access_token = validate_id_token_and_generate_access_key(token=id_token.credentials)
    return {"access_token": access_token}
