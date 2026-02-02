import boto3

from datetime import datetime, timedelta

from src.models.user_model import UserProfileDataModel


class UserAuthRepository:
    def __init__(self):
        self.dynamodb = boto3.client("dynamodb")
        self.users_table = self.dynamodb.Table("Vectora-App-Users")

    def create_user(self, user_data: UserProfileDataModel):
        self.users_table.put_item(Item=user_data.model_dump())

    def get_user(self):
        pass

    def fetch_all_user(self):
        pass

    def delete_user(self, user_data: UserProfileDataModel):
        """Updates the particular user with delete_after field with value of
        current Time + 30 days. After 30 days the user is automatically deleted."""

        current_time = int(datetime.now().timestamp())

        # Calculate the expireAt time (90 days from now) in epoch second format
        expire_at = int((datetime.now() + timedelta(days=30)).timestamp())

        self.users_table.update_item(
            Key={"user_id": user_data.user_id, "created_at": user_data.creation_time},
            UpdateExpression="set account_status=:s, expireAt=:e",
            ExpressionAttributeValues={":s": "PENDING_DELETION", ":e": expire_at},
        )

    def is_user_deleted_recently(self) -> bool:
        """Returns True if user account is found in DeletedUsers table
        and user deletion date is less than 30."""
        return False
