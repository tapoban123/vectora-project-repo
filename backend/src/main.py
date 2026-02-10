from fastapi import FastAPI, APIRouter
from mangum import Mangum

from src.api.auth_router import auth_router
from src.api.content_operations_router import content_router
from src.api.credits_and_quotas_router import user_credits_and_quotas_router

app = FastAPI()
handler = Mangum(app=app)
public_router = APIRouter()


@public_router.get("/")
def home():
    return "Welcome to Vectora App backend."


app.include_router(public_router)
app.include_router(auth_router)
app.include_router(content_router)
app.include_router(user_credits_and_quotas_router)
