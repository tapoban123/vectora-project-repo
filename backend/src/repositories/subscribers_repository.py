import boto3

from src.core.constants import AWS_DYNAMODB, AWS_REGION


class SubscribersRepository:
    def __init__(self):
        self.dynamodb = boto3.resource(AWS_DYNAMODB, region_name=AWS_REGION)
        self.subscribers_table = self.dynamodb.Table("Vectora-Subscribers")

    def create_subscriber(self):
        """Creates new subscriber with ttl of plan duration.
        Subscriber gets deleted automatically once plan duration is reached."""
        pass

    def fetch_user_subscription(self):
        """Fetches user subscription if exists,
        Else, returns null - meaning user is not a paid subscriber."""

    def fetch_all_subscribers(self):
        """Fetches all paid users for the Admin panel."""
        pass

    def renew_subscription(self, user_id: str):
        """Extends the ttl duration to extra plan duration."""
        pass

    def cancel_subscription(self):
        """Explicitly removes the user from the subscription table."""
        pass
