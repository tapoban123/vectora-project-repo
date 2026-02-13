from src.core.logger import logger
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

credits_repo = UserCreditsAndQuotasRepository()


def create_new_credits_profile(user_id: str):
    new_credits_profile = CreditsAndQuotaModel(
        user_id=user_id,
        remaining_ads_quota_for_today=3,
        remaining_credits=40,
    )
    try:
        return credits_repo.create_new_credits_profile(new_credits_profile)
    except Exception as e:
        logger.error(e)
        raise NewCreditsProfileCreationFailedException()


def fetch_remaining_credits(user_id: str):
    try:
        return credits_repo.fetch_remaining_credits(user_id)
    except Exception as e:
        logger.error(e)
        raise FetchRemainingCreditsException()


def fetch_remaining_ads_quota(user_id: str):
    try:
        return credits_repo.fetch_remaining_credits(user_id)
    except Exception as e:
        logger.error(e)
        raise FetchRemainingAdsQuotaException()


def update_daily_ads_quota():
    try:
        return credits_repo.renew_daily_ads_quota()
    except Exception as e:
        logger.error(e)
        raise RenewDailyAdsQuotaException()


def update_remaining_credits_per_usage(user_id: str, remaining_credits: float):
    try:
        return credits_repo.deduct_user_credits_on_usage(
            user_id, remaining_credits=remaining_credits
        )
    except Exception as e:
        logger.error(e)
        raise DeductRemainingAdsPerUsageException()


def grant_reward_on_ad_watch(
        user_id: str, remaining_credits: float, remaining_ads_quota: int
):
    try:
        return credits_repo.grant_ad_reward(
            user_id=user_id,
            remaining_credits=remaining_credits,
            remaining_ads_quota=remaining_ads_quota,
        )
    except Exception as e:
        logger.error(e)
        raise GrantRewardOnAdWatchException()
