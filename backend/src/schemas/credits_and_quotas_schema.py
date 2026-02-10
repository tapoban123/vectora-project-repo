from typing import Optional

from pydantic import BaseModel, Field


class CreditsAndQuotasSchema(BaseModel):
    id: str = Field(...)
    userId: str = Field(..., validation_alias="user_id")  # Partition Key
    remainingAdsQuotaForToday: int = Field(
        ..., ge=0, le=3, validation_alias="remaining_ads_quota_for_today"
    )
    remainingCredits: int = Field(..., validation_alias="remaining_credits")
    lastAdWatchTime: Optional[int] = Field(
        default=None, validation_alias="last_ad_watch_time"
    )
    lastCreditUseTime: Optional[int] = Field(
        default=None, validation_alias="last_credit_use_time"
    )
