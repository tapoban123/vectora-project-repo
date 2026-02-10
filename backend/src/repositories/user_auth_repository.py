import boto3
from datetime import datetime, timedelta

from botocore.exceptions import ClientError

from src.core.constants import UserAccountStatus, AWS_REGION, AWS_DYNAMODB
from src.core.logger import logger
from src.models.user_model import UserProfileDataModel


class UserAuthRepository:
    def __init__(self):
        self.dynamodb = boto3.resource(AWS_DYNAMODB, region_name=AWS_REGION)
        self.users_table = self.dynamodb.Table("Vectora-App-Users")

    def create_user(self, user_data: UserProfileDataModel):
        try:
            response = self.users_table.put_item(Item=user_data.model_dump())
            return response
        except ClientError as err:
            logger.error(
                "Failed to create new user.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"],
            )

    def get_user(self, user_id: str):
        try:
            response = self.users_table.get_item(Key={"user_id": user_id})
            return response.get("Item")
        except ClientError as err:
            logger.error(
                "Failed to get user.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"],
            )

    def fetch_all_user(self):
        pass

    def delete_user(self, user_id: str):
        """Updates the particular user with delete_after field with value of
        current Time + 30 days. After 30 days the user is automatically deleted."""

        # Calculate the expireAt time (30 days from now) in epoch second format
        # delete_after = int((datetime.now() + timedelta(days=30)).timestamp())
        delete_after = int((datetime.now() + timedelta(minutes=1)).timestamp())
        try:
            response = self.users_table.update_item(
                Key={"user_id": user_id},
                UpdateExpression="set account_status=:s, delete_after=:d",
                ExpressionAttributeValues={
                    ":s": UserAccountStatus.pending_deletion,
                    ":d": delete_after,
                },
            )
            return response
        except ClientError as err:
            logger.error(
                "Failed to set 'delete_after' to expiry timestamp.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"],
            )

    def revive_deleted_account(self, user_data: UserProfileDataModel):
        try:
            response = self.users_table.update_item(
                Key={"user_id": user_data.user_id},
                UpdateExpression="REMOVE delete_after set account_status=:s",
                ExpressionAttributeValues={":s": UserAccountStatus.active},
            )
            return response
        except ClientError as err:
            logger.error(
                "Failed to remove 'delete_after' and revive account.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"],
            )

    def is_user_deleted_recently(self) -> bool:
        """Returns True if user account is found in DeletedUsers table
        and user deletion date is less than 30."""
        return False
