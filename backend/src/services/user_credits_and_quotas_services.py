from src.exceptions import (
    NewCreditsProfileCreationFailedException,
    FetchRemainingCreditsException,
    FetchRemainingAdsQuotaException,
    RenewDailyAdsQuotaException,
    DeductRemainingAdsPerUsageException,
    GrantRewardOnAdWatchException,
)
from src.models.credits_and_quota_model import CreditsAndQuotaModel
from src.repositories.user_credits_and_quotas_repository import (
    UserCreditsAndQuotasRepository,
)


def create_new_credits_profile(user_id: str):
    credits_repo = UserCreditsAndQuotasRepository()
    new_credits_profile = CreditsAndQuotaModel(
        user_id=user_id,
        remaining_ads_quota_for_today=3,
        remaining_credits=40,
    )
    try:
        return credits_repo.create_new_credits_profile(new_credits_profile)
    except:
        raise NewCreditsProfileCreationFailedException()


def fetch_remaining_credits(user_id: str):
    credits_repo = UserCreditsAndQuotasRepository()
    try:
        return credits_repo.fetch_remaining_credits(user_id)
    except:
        raise FetchRemainingCreditsException()


def fetch_remaining_ads_quota(user_id: str):
    credits_repo = UserCreditsAndQuotasRepository()
    try:
        return credits_repo.fetch_remaining_credits(user_id)
    except:
        raise FetchRemainingAdsQuotaException()


def update_daily_ads_quota():
    credits_repo = UserCreditsAndQuotasRepository()
    try:
        return credits_repo.renew_daily_ads_quota()
    except:
        raise RenewDailyAdsQuotaException()


def deduct_remaining_credits_per_usage(user_id: str, remaining_credits: float):
    credits_repo = UserCreditsAndQuotasRepository()
    try:
        return credits_repo.deduct_user_credits_on_usage(
            user_id, remaining_credits=remaining_credits
        )
    except:
        raise DeductRemainingAdsPerUsageException()


def grant_reward_on_ad_watch(
    user_id: str, remaining_credits: float, remaining_ads_quota: int
):
    credits_repo = UserCreditsAndQuotasRepository()
    try:
        return credits_repo.grant_ad_reward(
            user_id=user_id,
            remaining_credits=remaining_credits,
            remaining_ads_quota=remaining_ads_quota,
        )
    except:
        raise GrantRewardOnAdWatchException()
