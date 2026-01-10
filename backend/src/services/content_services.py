from io import BytesIO
from fastapi import UploadFile
import voyageai
from PIL import Image
import cohere
from google import genai
from google.genai import types, errors

from src.core.constants import VOYAGE_API_SECRET, IMAGE_EMBEDDING_MODEL, COHERE_API_KEY, GEMINI_API_KEY

voyage_client = voyageai.Client(api_key=VOYAGE_API_SECRET)
co = cohere.ClientV2(api_key=COHERE_API_KEY)


async def generate_image_embeddings(image: UploadFile):
    image_contents = await image.read()
    img = Image.open(BytesIO(image_contents)).convert("RGB")
    inputs = [
        [img]
    ]
    result = voyage_client.multimodal_embed(inputs, model=IMAGE_EMBEDDING_MODEL,
                                            output_dimension=512,
                                            input_type="document", )
    return result


def generate_text_embeddings_prod(text: str):
    count = 0
    while True:
        try:
            # text_inputs = [
            #     {
            #         "content": [
            #             {"type": "text", "text": text},
            #         ]
            #     },
            # ]

            text_inputs = ["i love soup", "soup is my favorite", "london is far away"]

            response = co.embed(
                texts=text_inputs,
                model="embed-v4.0",
                input_type="search_document",
                embedding_types=["float"],
                output_dimension=512
            )
            return response
        except cohere.errors.too_many_requests_error.TooManyRequestsError:
            count += 1
            print(f"[Cohere] TooManyRequestsError occurred; Count: {count}")
            continue


def generate_text_embeddings_dev(text: str):
    client = genai.Client(api_key=GEMINI_API_KEY)
    count = 0
    while True:
        try:
            # text_inputs = [
            #     "What is the meaning of life?",
            #     "What is the purpose of existence?",
            #     "How do I bake a cake?"
            # ]

            response = client.models.embed_content(
                model="gemini-embedding-001",
                contents=text,
                config=types.EmbedContentConfig(output_dimensionality=512)
            )
            return response
        except:
            count += 1
            print(f"[Cohere] TooManyRequestsError occurred; Count: {count}")
            continue
