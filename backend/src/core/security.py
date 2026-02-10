from typing import Annotated

from fastapi.params import Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

from src.services.auth_services import sign_in_user_service, validate_id_token_and_generate_access_key, \
    validate_access_token

security = HTTPBearer()


def get_user_dep(access_token: Annotated[HTTPAuthorizationCredentials, Depends(security)]):
    return validate_access_token(token=access_token.credentials)
