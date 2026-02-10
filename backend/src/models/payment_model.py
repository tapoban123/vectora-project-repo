import uuid

from pydantic import BaseModel, Field


class PaymentModel(BaseModel):
    payment_id: str = Field(default_factory=lambda: uuid.uuid4().hex)
    transaction_id: str = Field(...)
    user_id: str = Field(...)  # Partition Key
    creation_time: int = Field(...)
    amount_in_inr: int = Field(...)
    ADMIN_GSI_PK: str = Field(default="PAYMENTS")
