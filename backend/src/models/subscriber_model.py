import uuid

from pydantic import BaseModel, Field

from src.core.utils import get_current_time_milliseconds_epoch


class SubscriberModel(BaseModel):
    subs_id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    user_id: str = Field(...)  # Partition Key
    plan: str = Field(...)
    amount_paid: float = Field(...)
    start_time: int = Field(
        default_factory=lambda: get_current_time_milliseconds_epoch()
    )
    expiry_time: int = Field(...)
    renewed_time: int = Field(
        default=None
    )  # Updates when user renews current plan before expiry.
    ADMIN_GSI_PK: str = Field(default="SUBSCRIPTION")
