from typing import Annotated

from fastapi import APIRouter, Depends

from src.core.security import get_user_dep
from src.schemas.credits_and_quotas_schema import (
    CreditsAndQuotasSchema,
    DeductCreditsSchema,
    GrantRewardSchema,
)
from src.services.user_credits_and_quotas_services import (
    fetch_remaining_credits,
    update_daily_ads_quota,
    update_remaining_credits_per_usage,
    grant_reward_on_ad_watch,
)

user_credits_and_quotas_router = APIRouter(
    tags=["Credits & Quotas"], prefix="/credits-and-quotas"
)


@user_credits_and_quotas_router.get("/user", response_model=CreditsAndQuotasSchema)
def fetch_credits_and_quotas_of_user(user_id: Annotated[str, Depends(get_user_dep)]):
    return fetch_remaining_credits(user_id)


@user_credits_and_quotas_router.put("/update-daily-ads-quota")
def update_user_daily_ads_quota():
    return update_daily_ads_quota()


@user_credits_and_quotas_router.put("/use-credits")
def update_remaining_credits(
    user_id: Annotated[str, Depends(get_user_dep)],
    remaining_credits: DeductCreditsSchema,
):
    return update_remaining_credits_per_usage(
        user_id, remaining_credits=remaining_credits.remaining_credits
    )


@user_credits_and_quotas_router.put("/grant-reward")
def grant_ad_watch_reward(
    user_id: Annotated[str, Depends(get_user_dep)], updated_credits: GrantRewardSchema
):
    return grant_reward_on_ad_watch(
        user_id,
        remaining_credits=updated_credits.remaining_credits,
        remaining_ads_quota=updated_credits.remaining_ads_quota,
    )
