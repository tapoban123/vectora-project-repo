from typing import Annotated

from fastapi import APIRouter

from src.core.security import get_user_dep
from src.schemas.credits_and_quotas_schema import CreditsAndQuotasSchema
from src.services.user_credits_and_quotas_services import fetch_remaining_credits

user_credits_and_quotas_router = APIRouter(
    tags=["Credits & Quotas"], prefix="/credits-and-quotas"
)


@user_credits_and_quotas_router.get("/user", response_model=CreditsAndQuotasSchema)
def fetch_credits_and_quotas_of_user(user_id: Annotated[str, get_user_dep]):
    return fetch_remaining_credits(user_id)
