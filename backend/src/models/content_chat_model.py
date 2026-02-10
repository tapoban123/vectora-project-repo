from pydantic import BaseModel, Field
import uuid

from src.core.utils import get_current_time_milliseconds_epoch


class ContentChatModel(BaseModel):
    id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    creation_time: int = Field(
        default_factory=lambda: get_current_time_milliseconds_epoch()
    )
    pinecone_collection_id: str = Field(...)
    content_id: str = Field(...)
    ADMIN_GSI_PK: str = Field(default="CONTENT_CHAT")
