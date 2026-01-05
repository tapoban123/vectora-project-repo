from fastapi import APIRouter, Body, UploadFile, File
from typing import Annotated

import uuid
from src.schemas.content_operations_schemas import ImageEmbeddingSchema, TextEmbeddingSchema
from src.services.content_services import generate_image_embeddings, generate_text_embeddings_prod, \
    generate_text_embeddings_dev

content_router = APIRouter(prefix="/content")


@content_router.post("/embeddings/image")
async def get_image_embeddings(image: Annotated[UploadFile, File()], cid: str = Body(default=None)):
    embeddings = await generate_image_embeddings(image)
    return {
        "id": uuid.uuid4().hex,
        "cid": cid,
        "embeddings": embeddings.embeddings,
    }


@content_router.post("/embeddings/text")
async def get_text_embeddings(textData: TextEmbeddingSchema):
    embeddings = generate_text_embeddings_prod(textData.text)
    return {
        "id": uuid.uuid4().hex,
        "cid": textData.cid,
        "embeddings": embeddings.embeddings.float_,
    }


@content_router.post("/dev/embeddings/text")
async def get_text_embeddings(textData: TextEmbeddingSchema):
    embeddings = generate_text_embeddings_dev(textData.text)
    return {
        "id": uuid.uuid4().hex,
        "cid": textData.cid,
        "embeddings": embeddings.embeddings[0].values,
    }
