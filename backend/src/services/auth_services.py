import firebase_admin
from firebase_admin import credentials
from firebase_admin import auth

cred = credentials.Certificate("vectora-firebase-private-key.json")
firebase_admin.initialize_app(cred)


def sign_in_user_service(token: str):
    try:
        claims = auth.verify_id_token(token)
        return claims
    except ValueError as e:
        print(f"Invalid Token: {e}")
        return None
    except auth.InvalidIdTokenError as e:
        print(f"Token verification failed:{e}")
        # raise Exception(e)
