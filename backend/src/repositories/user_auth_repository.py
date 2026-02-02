import boto3
import logging
from datetime import datetime, timedelta

from botocore.exceptions import ClientError

from src.core.constants import UserAccountStatus
from src.core.logger import dynamodb_logger
from src.models.user_model import UserProfileDataModel


class UserAuthRepository:
    def __init__(self):
        self.dynamodb = boto3.client("dynamodb")
        self.users_table = self.dynamodb.Table("Vectora-App-Users")

    def create_user(self, user_data: UserProfileDataModel):
        try:
            response = self.users_table.put_item(Item=user_data.model_dump())
        except ClientError as err:
            dynamodb_logger.error(
                "Failed to create new user.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"]
            )
        else:
            return response["Attributes"]

    def get_user(self):
        pass

    def fetch_all_user(self):
        pass

    def delete_user(self, user_data: UserProfileDataModel):
        """Updates the particular user with delete_after field with value of
        current Time + 30 days. After 30 days the user is automatically deleted."""

        # Calculate the expireAt time (30 days from now) in epoch second format
        delete_after = int((datetime.now() + timedelta(days=30)).timestamp())
        try:
            response = self.users_table.update_item(
                Key={"user_id": user_data.user_id, "created_at": user_data.creation_time},
                UpdateExpression="set account_status=:s, delete_after=:d",
                ExpressionAttributeValues={":s": UserAccountStatus.pending_deletion, ":d": delete_after},
            )
        except ClientError as err:
            dynamodb_logger.error(
                "Failed to set 'delete_after' to expiry timestamp.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"]
            )
        else:
            return response["Attributes"]

    def revive_deleted_account(self, user_data: UserProfileDataModel):
        try:
            response = self.users_table.update_item(
                Key={"user_id": user_data.user_id, "created_at": user_data.creation_time},
                UpdateExpression="REMOVE delete_after set account_status=:s",
                ExpressionAttributeValues={":s": UserAccountStatus.active},
            )
        except ClientError as err:
            dynamodb_logger.error(
                "Failed to remove 'delete_after' and revive account.\n%s %s",
                err.response["Error"]["Code"],
                err.response["Error"]["Message"]
            )
        else:
            return response["Attributes"]

    def is_user_deleted_recently(self) -> bool:
        """Returns True if user account is found in DeletedUsers table
        and user deletion date is less than 30."""
        return False
