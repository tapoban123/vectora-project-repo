from typing import Annotated

from fastapi import APIRouter, Depends, status, Body

from src.core.security import get_user_dep
from src.schemas.chat_contents_schema import CreateChatContentSchema, ChatContentSchema, GenerateAiResponseSchema
from src.services.content_chat_services import create_chat_context, delete_chat_context, reply_user_message

content_chat_router = APIRouter(prefix="/content/chat", tags=["Content Chat"])


@content_chat_router.post("/create-context", status_code=status.HTTP_201_CREATED)
def create_context_for_chat(uid: Annotated[str, Depends(get_user_dep)], details: CreateChatContentSchema):
    return create_chat_context(content=details.content_text, uid=uid, cid=details.cid)


@content_chat_router.delete("/delete-context")
def delete_context_of_chat(uid: Annotated[str, Depends(get_user_dep)], details: ChatContentSchema):
    return delete_chat_context(uid=uid, cid=details.cid)


@content_chat_router.post("/ai-response")
def generate_ai_response(uid: Annotated[str, Depends(get_user_dep)], details: GenerateAiResponseSchema):
    return reply_user_message(cid=details.cid, uid=uid, user_message=details.user_message)
