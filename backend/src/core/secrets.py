import boto3
import json

import os

from dotenv import load_dotenv

load_dotenv()

ssm = boto3.client("ssm")


def get_param(name: str):
    return ssm.get_parameter(
        Name=name,
        WithDecryption=True
    )["Parameter"]["Value"]


# API Secrets
GEMINI_API_KEY = get_param("/vectora/api_keys/GEMINI_API_KEY")
# VOYAGE_API_SECRET = os.getenv("VOYAGE_AI_API_SECRET")
# COHERE_API_KEY = os.getenv("COHERE_API_KEY")
# OPEN_ROUTER_API_KEY = os.getenv("OPEN_ROUTER_API_KEY")

# JWT Secrets
JWT_SECRET_KEY = get_param("/vectora/jwt/JWT_SECRET_KEY")
FIREBASE_PRIVATE_KEY = json.loads(get_param("/vectora/firebase/service-account"))

# Constant Strings
# EXPIRE_MINUTES_ACCESS_TOKEN = os.environ.get("ACCESS_TOKEN_EXPIRE_MINUTES")
EXPIRE_MINUTES_ACCESS_TOKEN = os.getenv("ACCESS_TOKEN_EXPIRE_MINUTES")
JWT_HASH_ALGORITHM = "HS256"
