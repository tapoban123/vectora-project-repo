from io import BytesIO
from fastapi import UploadFile
import voyageai
from PIL import Image
import cohere

from src.core.constants import VOYAGE_API_SECRET, IMAGE_EMBEDDING_MODEL, COHERE_API_KEY

voyage_client = voyageai.Client(api_key=VOYAGE_API_SECRET)
co = cohere.ClientV2(api_key=COHERE_API_KEY)


async def generate_image_embeddings(image: UploadFile):
    image_contents = await image.read()
    img = Image.open(BytesIO(image_contents)).convert("RGB")
    inputs = [
        [img]
    ]
    result = voyage_client.multimodal_embed(inputs, model=IMAGE_EMBEDDING_MODEL)
    return result


def generate_text_embeddings(text: str):
    text_inputs = [
        {
            "content": [
                {"type": "text", "text": text},
            ]
        },
    ]

    response = co.embed(
        inputs=text_inputs,
        model="embed-v4.0",
        input_type="classification",
        embedding_types=["float"],
        output_dimension=1024
    )
    return response
