from langchain_google_genai import GoogleGenerativeAIEmbeddings

from src.core.constants import GEMINI_EMBEDDING_MODEL, GEMINI_CHAT_MODEL
from src.core.secrets import GEMINI_API_KEY
from google import genai
from google.genai import types, errors

from src.exceptions import GeminiApiEmbeddingModelException

client = genai.Client(api_key=GEMINI_API_KEY)


def get_gemini_embedding_model(text_to_embed: str):
    try:
        return client.models.embed_content(
            model=GEMINI_EMBEDDING_MODEL,
            contents=text_to_embed,
            config=types.EmbedContentConfig(output_dimensionality=512),
        )
    except errors.APIError as e:
        raise GeminiApiEmbeddingModelException(msg=str(e))


def get_gemini_chat_model(contents_list: list):
    try:
        return client.models.generate_content(
            model=GEMINI_CHAT_MODEL,
            contents=contents_list,
        )
    except errors.APIError as e:
        raise GeminiApiEmbeddingModelException(msg=str(e))


def get_langchain_gemini_embedding():
    return GoogleGenerativeAIEmbeddings(
        api_key=GEMINI_API_KEY,
        model=GEMINI_EMBEDDING_MODEL,
        output_dimensionality=1536,
    )
