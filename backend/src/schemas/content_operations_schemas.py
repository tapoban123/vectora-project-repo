from typing import Annotated

from fastapi import UploadFile, File
from pydantic import BaseModel, Field


class ImageEmbeddingSchema(BaseModel):
    image: Annotated[UploadFile, File()]
    cid: str
    contentType: str | None = None


class TextEmbeddingSchema(BaseModel):
    text: str
    cid: str | None = None
    contentType: str | None = None


class PdfEmbeddingResponseSchema(BaseModel):
    cid: str | None = None
    extractedText: str
    embeddings: list[float]
    contentType: str | None = None
