import uuid
from pydantic import BaseModel, Field

from src.core.utils import get_current_time_milliseconds_epoch


class NotificationModel(BaseModel):
    notification_id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    notification_type: str = Field(...)
    message: str = Field(...)
    creation_time: int = Field(
        default_factory=lambda: get_current_time_milliseconds_epoch()
    )
    ADMIN_GSI_PK: str = Field(default="NOTIFICATION")
