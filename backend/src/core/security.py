from typing import Annotated

from fastapi.params import Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

from src.services.auth_services import validate_access_token

security = HTTPBearer()


def get_user_dep(
    access_token: Annotated[HTTPAuthorizationCredentials, Depends(security)],
):
    return validate_access_token(token=access_token.credentials)
