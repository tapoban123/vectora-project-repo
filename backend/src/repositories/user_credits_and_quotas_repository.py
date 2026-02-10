import boto3
from botocore.exceptions import ClientError

from src.core.constants import AWS_DYNAMODB, AWS_REGION
from src.core.logger import logger
from src.models.credits_and_quota_model import CreditsAndQuotaModel


class UserCreditsAndQuotasRepository:
    def __init__(self):
        self.dynamodb = boto3.resource(AWS_DYNAMODB, region_name=AWS_REGION)
        self.credits_table = self.dynamodb.Table("Vectora-Users-Credits-And-Quota")

    def create_new_credits_profile(self, data: CreditsAndQuotaModel):
        """Create new credits profile when new user is created."""
        try:
            response = self.credits_table.put_item(Item=data.model_dump())
            return response
        except ClientError as err:
            logger.error(
                "Failed to create new credits profile.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"]
            )

    def fetch_remaining_credits(self, user_id: str):
        try:
            response = self.credits_table.get_item(Key={"user_id": user_id})
            return response.get("Item")
        except ClientError as err:
            logger.error(
                "Failed to fetch user credits.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"]
            )

    def update_user_credits(self, user_id: str, remaining_credits: float):
