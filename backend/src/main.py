from fastapi import FastAPI, APIRouter
from mangum import Mangum

from src.api.auth_router import auth_router
from src.api.content_chat_router import content_chat_router
from src.api.content_operations_router import content_router
from src.api.credits_and_quotas_router import user_credits_and_quotas_router
from src.api.payments_router import payments_router
from src.services.user_credits_and_quotas_services import update_daily_ads_quota

app = FastAPI()
asgi_handler = Mangum(app=app)
public_router = APIRouter()


def handler(event, context):
    print("FULL EVENT:", event)

    if event.get("source") in ["aws.events", "aws.scheduler"]:
        print("Scheduler to reset users' daily ads quota triggered")
        
        update_daily_ads_quota()
        return {"status": "daily ads quota for all users renewed."}

    return asgi_handler(event, context)


@public_router.get("/")
def home():
    return "Welcome to Vectora App backend."


app.include_router(public_router)
app.include_router(auth_router)
app.include_router(content_router)
app.include_router(user_credits_and_quotas_router)
app.include_router(payments_router)
app.include_router(content_chat_router)
