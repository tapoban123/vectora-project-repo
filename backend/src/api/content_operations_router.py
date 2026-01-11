from fastapi import APIRouter, Body, UploadFile, File
from typing import Annotated

import uuid
from src.schemas.content_operations_schemas import ImageEmbeddingSchema, TextEmbeddingSchema
from src.services.content_services import generate_text_embeddings_gemini, generate_image_embeddings_from_text

content_router = APIRouter(prefix="/content")


@content_router.post("/embeddings/image")
async def get_image_embeddings(image: Annotated[UploadFile, File()], cid: str = Body(default=None)):
    embeddings_with_description = await generate_image_embeddings_from_text(image)
    return {
        "id": uuid.uuid4().hex,
        "cid": cid,
        **embeddings_with_description,
    }


# @content_router.post("/embeddings/text")
# async def get_text_embeddings(textData: TextEmbeddingSchema):
#     embeddings = generate_text_embeddings_dev(textData.text)
#     if textData.cid is None:
#         return {"embeddings": embeddings.embeddings[0]}
#
#     return {
#         "id": uuid.uuid4().hex,
#         "cid": textData.cid,
#         "embeddings": embeddings.embeddings.float_,
#     }
#

@content_router.post("/embeddings/text")
async def get_text_embeddings(textData: TextEmbeddingSchema):
    embeddings = generate_text_embeddings_gemini(textData.text)
    if textData.cid is None:
        return {"embeddings": embeddings}

    return {
        "id": uuid.uuid4().hex,
        "cid": textData.cid,
        "embeddings": embeddings,
    }
