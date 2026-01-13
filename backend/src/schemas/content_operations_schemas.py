from typing import Annotated

from fastapi import UploadFile, File
from pydantic import BaseModel


class ImageEmbeddingSchema(BaseModel):
    image: Annotated[UploadFile, File()]
    cid: str | None = None
    contentType: str | None = None


class TextEmbeddingSchema(BaseModel):
    text: str
    cid: str | None = None
    contentType: str | None = None
