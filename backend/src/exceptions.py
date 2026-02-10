from fastapi import HTTPException, status


class AuthExceptions(HTTPException):
    """Base Exception for Authentication errors."""
    pass


class UserSignInException(HTTPException):
    def __init__(self):
        message = "Failed to sign in user"
        super().__init__(status_code=status.HTTP_401_UNAUTHORIZED, detail=message)


class InvalidAccessTokenException(AuthExceptions):
    def __init__(self):
        message = "Invalid Access Token"
        super().__init__(status_code=status.HTTP_401_UNAUTHORIZED, detail=message)


class ExpiredAccessTokenException(AuthExceptions):
    def __init__(self):
        message = "Access Token Expired"
        super().__init__(status_code=status.HTTP_401_UNAUTHORIZED, detail=message)


class InvalidIdTokenException(AuthExceptions):
    def __init__(self):
        message = "Invalid Id Token"
        super().__init__(status_code=status.HTTP_401_UNAUTHORIZED, detail=message)


class ExpiredIdTokenException(AuthExceptions):
    def __init__(self):
        message = "Id Token Expired"
        super().__init__(status_code=status.HTTP_401_UNAUTHORIZED, detail=message)


class UserDeletionException(AuthExceptions):
    def __init__(self):
        message = "Failed to delete user"
        super().__init__(status_code=status.HTTP_404_NOT_FOUND, detail=message)
