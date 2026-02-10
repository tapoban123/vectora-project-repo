import uuid
from typing import Optional

from pydantic import BaseModel, Field


class CreditsAndQuotaModel(BaseModel):
    id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    user_id: str = Field(...)  # Partition Key
    remaining_ads_quota_for_today: int = Field(..., ge=0, le=3)
    remaining_credits: int = Field(...)
    last_ad_watch_time: Optional[int] = Field(default=None)
    last_credit_use_time: Optional[int] = Field(default=None)
    ADMIN_GSI_PK: Optional[str] = Field(default="USER_CREDITS")
