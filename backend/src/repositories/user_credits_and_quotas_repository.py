import boto3
from botocore.exceptions import ClientError

from src.core.constants import AWS_DYNAMODB, AWS_REGION
from src.core.logger import logger
from src.core.utils import get_current_time_milliseconds_epoch
from src.models.credits_and_quota_model import CreditsAndQuotaModel
from src.services.user_credits_and_quotas_services import fetch_remaining_credits


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

    def grant_ad_reward(self, user_id: str, remaining_credits: float, remaining_ads_quota: int):
        """Increase remaining credits by 15 as a reward of watching an ad."""
        try:
            response = self.credits_table.update_item(Key={"user_id": user_id},
                                                      UpdateExpression="set remaining_credits=:c remaining_ads_quota_for_today=:a last_ad_watch_time=:t",
                                                      ExpressionAttributeValues={":a": remaining_credits,
                                                                                 ":c": remaining_ads_quota,
                                                                                 ":t": get_current_time_milliseconds_epoch()})
            return response
        except ClientError as err:
            logger.error(
                "Failed to grant user reward.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"]
            )

    def deduct_user_credits_on_usage(self, user_id: str, remaining_credits: float):
        """Deduct the number of used credits from remaining credits."""
        try:
            response = self.credits_table.update_item(Key={"user_id": user_id},
                                                      UpdateExpression="set remaining_credits=:c last_credit_use_time=:t",
                                                      ExpressionAttributeValues={":a": remaining_credits,
                                                                                 ":t": get_current_time_milliseconds_epoch()})
            return response
        except ClientError as err:
            logger.error(
                "Failed to deduct user credits.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"]
            )

    def renew_daily_ad_quota(self):
        try:
            response = self.credits_table.scan()
            updated_count = 0

            while True:
                items = response["Items"]

                for item in items:
                    key = {"user_id": item["user_id"]}
                    self.credits_table.update_item(Key=key,
                                                   UpdateExpression="set remaining_ads_quota_for_today=:quota",
                                                   ExpressionAttributeValues={":quota": 3})
                    updated_count += 1

                if "LastEvaluatedKey" not in response:
                    break

                response = self.credits_table.scan(ExclusiveStartKey=response["LastEvaluatedKey"])
            return updated_count

        except ClientError as err:
            logger.error(
                "Failed to update daily ads quota.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"]
            )
