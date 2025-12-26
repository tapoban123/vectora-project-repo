import requests

from src.core.api_constants import VOYAGE_API_SECRET, VOYAGE_EMBEDDING_API_URL


def generate_embeddings():
    headers = {"Authorization": f"Bearer {VOYAGE_API_SECRET}", "content-type": "application/json"}
    body = {
        "inputs": [
            {
                "content": [
                    {
                        "type": "text",
                        "text": "This is a banana."
                    },
                    {
                        "type": "image_url",
                        "image_url": "https://raw.githubusercontent.com/voyage-ai/voyage-multimodal-3/refs/heads/main/images/banana.jpg"
                    },
                ]
            }
        ],
        "model": "voyage-multimodal-3.5"
    }

    response = requests.post(
        url=VOYAGE_EMBEDDING_API_URL,
        headers=headers,
        json=body
    )
    return response.json()
