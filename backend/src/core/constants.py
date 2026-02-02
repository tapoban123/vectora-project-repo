# VOYAGE_EMBEDDING_API_URL = "https://api.voyageai.com/v1/multimodalembeddings"

# Embedding models
IMAGE_EMBEDDING_MODEL = "voyage-multimodal-3.5"
TEXT_EMBEDDING_MODEL = "embed-v4.0"
GEMINI_EMBEDDING_MODEL = "gemini-embedding-001"


# CHAT_DOCUMENT_EMBEDDING_MODEL = "gemini-embedding-001"
#
# def get_allen_ai_model():
#     model = init_chat_model(
#         model="google/gemma-3-12b-it:free",
#         model_provider="openai",
#         base_url="https://openrouter.ai/api/v1",
#         api_key=OPEN_ROUTER_API_KEY,
#     )
#     return model
#
#
# def get_gemini_model():
#     model = ChatGoogleGenerativeAI(
#         model="gemini-2.5-flash",
#         temperature=1.0,  # Gemini 3.0+ defaults to 1.0
#         max_tokens=None,
#         timeout=None,
#         max_retries=2,
#         # other params...
#     )
#     return model


class SubscriptionPlans:
    free: str = "FREE"
    basic: str = "BASIC"
    premium: str = "PREMIUM"


class UserAccountStatus:
    active: str = "ACTIVE"
    pending_deletion: str = "PENDING_DELETION"


SUBSCRIPTION_PLANS_LIST: list[str] = [
    SubscriptionPlans.free,
    SubscriptionPlans.basic,
    SubscriptionPlans.premium,
]
