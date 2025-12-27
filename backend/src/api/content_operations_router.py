from fastapi import APIRouter, UploadFile

from src.services.content_services import generate_image_embeddings, generate_text_embeddings

content_router = APIRouter(prefix="/content")


@content_router.post("/embeddings")
async def get_embeddings(image: UploadFile):
    return await generate_image_embeddings(image)

@content_router.post("/text-embeddings")
async def get_text_embeddings(text: str):
    return generate_text_embeddings(text)