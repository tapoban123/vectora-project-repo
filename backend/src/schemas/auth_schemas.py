import uuid

from pydantic import BaseModel, Field


class UserProfileDetailsSchema(BaseModel):
    internal_id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    user_id: str = Field(..., validation_alias="user_id")
    name: str = Field(...)
    profile_picture: str = Field(..., validation_alias="picture")
    created_at: int = Field(..., validation_alias="auth_time")
    email: str = Field(...)


class AccessTokenSchema(BaseModel):
    access_token: str = Field(...)
