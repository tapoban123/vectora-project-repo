from io import BytesIO

from fastapi import UploadFile
import voyageai
from PIL import Image
import cohere
from fastapi import HTTPException
from google import genai
from google.genai import types, errors
from src.core.constants import VOYAGE_API_SECRET, IMAGE_EMBEDDING_MODEL, COHERE_API_KEY, GEMINI_API_KEY
from src.core.prompts import IMAGE_DESCRIPTION_PROMPT
from src.core.utils import clean_vision_text

voyage_client = voyageai.Client(api_key=VOYAGE_API_SECRET)
co = cohere.ClientV2(api_key=COHERE_API_KEY)
client = genai.Client(api_key=GEMINI_API_KEY)


async def generate_image_embeddings_from_text(image: UploadFile):
    """Image -> Image description -> Text Embedding of description -> Return cid, description, embeddings, file type."""

    image_description = await _generate_image_description(image)
    clean_des = clean_vision_text(image_description)
    embeddings = generate_text_embeddings_gemini(clean_des)
    return {"description": clean_des, "embeddings": embeddings}


async def _generate_image_description(image: UploadFile) -> str | None:
    error_count = 0
    while True:
        try:
            image_bytes = await image.read()
            image = types.Part.from_bytes(
                data=image_bytes, mime_type=image.content_type
            )
            response = client.models.generate_content(
                model="gemini-2.5-flash",
                contents=[IMAGE_DESCRIPTION_PROMPT, image],
            )
            return response.candidates[0].content.parts[0].text
        except errors.APIError:
            error_count += 1
            if error_count == 5:
                raise HTTPException(detail="Cannot generate image description")
            else:
                continue


def generate_text_embeddings_gemini(text: str):
    count = 0
    while True:
        try:
            response = client.models.embed_content(
                model="gemini-embedding-001",
                contents=text,
                config=types.EmbedContentConfig(output_dimensionality=512)
            )
            return response.embeddings[0].values
        except errors.APIError:
            count += 1
            print(f"[GEMINI] TooManyRequestsError occurred; Count: {count}")
            continue


async def generate_image_embeddings_voyageai(image: UploadFile):
    """Returns multimodal embeddings of an image generated using the VoyageAI embedding model."""
    image_contents = await image.read()
    img = Image.open(BytesIO(image_contents)).convert("RGB")
    inputs = [
        [img]
    ]
    result = voyage_client.multimodal_embed(inputs, model=IMAGE_EMBEDDING_MODEL,
                                            output_dimension=512,
                                            input_type="document", )
    return result


def generate_text_embeddings_cohere(text: str):
    """Returns embeddings of texts generated using the Cohere embedding model."""
    error_count = 0
    while True:
        try:
            text_inputs = ["i love soup", "soup is my favorite", "london is far away"]

            response = co.embed(
                texts=[text],
                model="embed-v4.0",
                input_type="search_document",
                embedding_types=["float"],
                output_dimension=512
            )
            return response
        except cohere.errors.too_many_requests_error.TooManyRequestsError:
            error_count += 1
            print(f"[Cohere] TooManyRequestsError occurred; Count: {error_count}")
            continue
