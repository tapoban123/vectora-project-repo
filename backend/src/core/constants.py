import os
from dotenv import load_dotenv

load_dotenv()

VOYAGE_EMBEDDING_API_URL = "https://api.voyageai.com/v1/multimodalembeddings"

VOYAGE_API_SECRET = os.getenv("VOYAGE_AI_API_SECRET")
COHERE_API_KEY = os.getenv("COHERE_API_KEY")
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")

IMAGE_EMBEDDING_MODEL = "voyage-multimodal-3.5"

TEXT_EMBEDDING_MODEL = "embed-v4.0"

GEMINI_EMBEDDING_MODEL = "gemini-embedding-001"
# CHAT_DOCUMENT_EMBEDDING_MODEL = "gemini-embedding-001"
