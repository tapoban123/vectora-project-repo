import boto3


class UserAuthRepository:
    def __init__(self):
        self.dynamodb = boto3.client("dynamodb")
