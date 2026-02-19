from typing import Annotated

from fastapi import APIRouter, Depends, status

from src.core.security import get_user_dep
from src.schemas.payment_schemas import CreatePaymentRequestSchema, OrderIdGenerationSchema
from src.services.payment_services import generate_order_id, fetch_all_user_payments, create_new_payment

payments_router = APIRouter(prefix="/payments", tags=["Payments"])


@payments_router.get("/order-id/generate", response_model=OrderIdGenerationSchema)
def generate_payment_order_id(user_id: Annotated[str, Depends(get_user_dep)]):
    return generate_order_id(user_id)


@payments_router.get("/payments/all/user")
def fetch_all_payments_of_user(user_id: Annotated[str, Depends(get_user_dep)]):
    return fetch_all_user_payments(user_id)


@payments_router.post("/payment/create", status_code=status.HTTP_201_CREATED)
def create_user_payment(user_id: Annotated[str, Depends(get_user_dep)], payment_details: CreatePaymentRequestSchema):
    return create_new_payment()
