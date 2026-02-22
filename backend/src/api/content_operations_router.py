from fastapi import APIRouter, Body, UploadFile, File, Depends
from typing import Annotated

import uuid

from src.core.security import get_user_dep
from src.schemas.content_operations_schemas import (
    TextEmbeddingSchema,
    PdfEmbeddingResponseSchema,
)
from src.services.content_services import (
    generate_text_embeddings_gemini,
    generate_image_embeddings_from_text,
    generate_pdf_embeddings,
)

content_router = APIRouter(prefix="/content")


@content_router.post("/embeddings/image")
async def get_image_embeddings(
        uid: Annotated[str, Depends(get_user_dep)],
        image: Annotated[UploadFile, File()],
        cid: str = Body(default=None),
        contentType: str = Body(default=None),
):
    embeddings_with_description = await generate_image_embeddings_from_text(image)
    return {
        "id": uuid.uuid4().hex,
        "cid": cid,
        "contentType": contentType,
        **embeddings_with_description,
    }


@content_router.post("/embeddings/text")
async def get_text_embeddings(uid: Annotated[str, Depends(get_user_dep)], textData: TextEmbeddingSchema):
    embeddings = generate_text_embeddings_gemini(textData.text)
    if textData.cid is None:
        return {"embeddings": embeddings}

    return {
        "id": uuid.uuid4().hex,
        "cid": textData.cid,
        "contentType": textData.contentType,
        "embeddings": embeddings,
    }


@content_router.post("/embeddings/pdf", response_model=PdfEmbeddingResponseSchema)
async def generate_pdf_embeddings_and_extract_content(
        uid: Annotated[str, Depends(get_user_dep)],
        pdf: UploadFile,
        cid: str = Body(default=None),
        contentType: str = Body(default=None),
):
    result = await generate_pdf_embeddings(pdf)
    return {**result.model_dump(), "cid": cid, "contentType": contentType}
