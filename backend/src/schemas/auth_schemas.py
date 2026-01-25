import uuid
from typing import Optional, Literal, Union

from pydantic import BaseModel, Field

from src.core.constants import SubscriptionPlans, SUBSCRIPTION_PLANS_LIST


class UserProfileDetailsSchema(BaseModel):
    internal_id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    user_id: str = Field(..., validation_alias="user_id")
    name: str = Field(...)
    profile_picture: str = Field(..., validation_alias="picture")
    creation_time: int = Field(..., validation_alias="auth_time")
    email: str = Field(...)
    subscription_type: Literal[*SUBSCRIPTION_PLANS_LIST] = Field(default=SubscriptionPlans.free)
    payment_date: Optional[int] = Field(default=None)


class AuthTokensSchema(BaseModel):
    access_token: str = Field(..., serialization_alias="accessToken")
    refresh_token: str = Field(..., serialization_alias="refreshToken")
