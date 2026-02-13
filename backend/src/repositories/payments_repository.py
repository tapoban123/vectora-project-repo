import boto3

from src.core.constants import AWS_DYNAMODB, AWS_REGION


class PaymentsRepository:
    def __init__(self):
        self.dynamodb = boto3.resource(AWS_DYNAMODB, region_name=AWS_REGION)
        self.payments_table = self.dynamodb.Table("Vectora-Payments")

    def create_payment(self):
        """Stores new payment details when user makes payment for subscription."""
        pass

    def fetch_user_payments(self, user_id: str):
        """Fetches all payments made by user by creationTime DESC."""
        pass

    def fetch_all_payments(self):
        """Fetches all payments to be monitored on Admin panel."""
        pass

    def delete_payment(self):
        """CAUTION: To be used only when payment made is invalid or for testing purposes.
        Admin use only."""
        pass
