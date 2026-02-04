import uuid

from pydantic import Field, BaseModel

from src.core.utils import get_current_time_milliseconds_epoch


class UserProfileDataModel(BaseModel):
    internal_id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    user_id: str = Field(...)
    name: str = Field(...)
    profile_picture: str = Field(...)
    created_at: int = Field(...)
    email: str = Field(...)
    ADMIN_GSI_PK: str = Field(default="USER")
    last_login: int = Field(default_factory=lambda: get_current_time_milliseconds_epoch())
    account_status: str = Field(default="ACTIVE")
