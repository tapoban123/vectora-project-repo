import razorpay
from razorpay import errors
from src.core.secrets import RAZORPAY_API_TEST_KEY, RAZORPAY_API_TEST_SECRET
from src.core.utils import get_current_time_milliseconds_epoch
from src.exceptions import OrderIdGenerationException
from src.schemas.payment_schemas import OrderIdGenerationSchema


def generate_order_id(user_id: str):
    try:
        client = razorpay.Client(auth=(RAZORPAY_API_TEST_KEY, RAZORPAY_API_TEST_SECRET))

        res = client.order.create({
            "amount": 14900,
            "currency": "INR",
            "receipt": f"receipt_{get_current_time_milliseconds_epoch()}",
            "notes": {
                "PAYMENT REASON": "SUBSCRIPTION",
            }
        })

        return OrderIdGenerationSchema.model_validate(res)

    except errors:
        raise OrderIdGenerationException()


def create_new_payment():
    pass


def fetch_all_user_payments(user_id: str):
    pass


def delete_payment():
    pass


def fetch_all_payments():
    pass
