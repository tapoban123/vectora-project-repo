from pydantic import BaseModel, Field


class ChatContentSchema(BaseModel):
    cid: str = Field(...)


class CreateChatContentSchema(ChatContentSchema):
    content_text: str = Field(...)


class GenerateAiResponseSchema(ChatContentSchema):
    user_message: str = Field(...)
