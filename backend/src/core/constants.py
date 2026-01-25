import os
from dotenv import load_dotenv
from langchain.chat_models import init_chat_model
from langchain_google_genai import ChatGoogleGenerativeAI

load_dotenv()

VOYAGE_EMBEDDING_API_URL = "https://api.voyageai.com/v1/multimodalembeddings"

VOYAGE_API_SECRET = os.getenv("VOYAGE_AI_API_SECRET")
COHERE_API_KEY = os.getenv("COHERE_API_KEY")
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")
OPEN_ROUTER_API_KEY = os.getenv("OPEN_ROUTER_API_KEY")
JWT_SECRET_KEY = os.getenv("JWT_SECRET_KEY")
EXPIRE_MINUTES_ACCESS_TOKEN = os.getenv("ACCESS_TOKEN_EXPIRE_MINUTES")
EXPIRE_DAYS_REFRESH_TOKEN = os.getenv("REFRESH_TOKEN_EXPIRE_DAYS")
JWT_HASH_ALGORITHM = "HS256"

IMAGE_EMBEDDING_MODEL = "voyage-multimodal-3.5"

TEXT_EMBEDDING_MODEL = "embed-v4.0"

GEMINI_EMBEDDING_MODEL = "gemini-embedding-001"


# CHAT_DOCUMENT_EMBEDDING_MODEL = "gemini-embedding-001"


def get_allen_ai_model():
    model = init_chat_model(
        model="google/gemma-3-12b-it:free",
        model_provider="openai",
        base_url="https://openrouter.ai/api/v1",
        api_key=OPEN_ROUTER_API_KEY,
    )
    return model


def get_gemini_model():
    model = ChatGoogleGenerativeAI(
        model="gemini-2.5-flash",
        temperature=1.0,  # Gemini 3.0+ defaults to 1.0
        max_tokens=None,
        timeout=None,
        max_retries=2,
        # other params...
    )
    return model


class SubscriptionPlans:
    free: str = "FREE"
    basic: str = "BASIC"
    premium: str = "PREMIUM"


SUBSCRIPTION_PLANS_LIST: list[str] = [SubscriptionPlans.free, SubscriptionPlans.basic, SubscriptionPlans.premium]
