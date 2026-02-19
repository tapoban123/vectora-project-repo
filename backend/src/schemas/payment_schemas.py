from pydantic import BaseModel, Field


class OrderIdGenerationSchema(BaseModel):
    amount: int = Field(...)
    created_at: int = Field(..., serialization_alias="createdAt")
    currency: str = Field(...)
    order_id: str = Field(..., serialization_alias="orderId", validation_alias="id")
    notes: dict[str, str] = Field(...)
    receipt: str = Field(...)
    status: str = Field(...)


class CreatePaymentRequestSchema(BaseModel):
    razorpay_signature: str = Field(...)
    razorpay_payment_id: str = Field(...)
    amount: int = Field(...)
    created_at: int = Field(..., serialization_alias="createdAt")
    currency: str = Field(...)
    order_id: str = Field(..., serialization_alias="orderId")
    notes: dict[str, str] = Field(...)
    receipt: str = Field(...)
    status: str = Field(...)
