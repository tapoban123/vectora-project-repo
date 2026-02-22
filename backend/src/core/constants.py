# Embedding models
IMAGE_EMBEDDING_MODEL = "voyage-multimodal-3.5"
TEXT_EMBEDDING_MODEL = "embed-v4.0"
GEMINI_EMBEDDING_MODEL = "gemini-embedding-001"

# Chat models
GEMINI_CHAT_MODEL = "gemini-2.5-flash"

# AWS
AWS_DYNAMODB: str = "dynamodb"
AWS_REGION: str = "ap-south-2"


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
