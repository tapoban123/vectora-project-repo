import uuid

from pydantic import Field, BaseModel

from src.core.utils import get_current_time_milliseconds_epoch


class UserProfileDataModel(BaseModel):
    internal_id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    user_id: str = Field(..., validation_alias="user_id")
    name: str = Field(...)
    profile_picture: str = Field(..., validation_alias="picture")
    creation_time: int = Field(..., validation_alias="auth_time", serialization_alias="created_at")
    email: str = Field(...)
    last_login: int = Field(default_factory=lambda: get_current_time_milliseconds_epoch())
    account_status: str = Field(default="ACTIVE")
