from pydantic import BaseModel, Field
import uuid


class UserAnalyticsModel(BaseModel):
    analytics_id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    user_id: str = Field(...)
    total_uploads: int = Field(...)
    total_ads_watched: int = Field(...)
    total_searches: int = Field(...)
