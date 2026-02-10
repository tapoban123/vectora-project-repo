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


class UserCreditsAndQuotaExceptions(HTTPException):
    """Base Exception for handling user credits and daily quotas errors."""
    pass


class NewCreditsProfileCreationFailedException(UserCreditsAndQuotaExceptions):
    def __init__(self):
        message = "Failed to create new credits profile."
        super().__init__(status_code=status.HTTP_409_CONFLICT, detail=message)


class FetchRemainingCreditsException(UserCreditsAndQuotaExceptions):
    def __init__(self):
        message = "Failed to fetch remaining credits of user."
        super().__init__(status_code=status.HTTP_404_NOT_FOUND, detail=message)


class FetchRemainingAdsQuotaException(UserCreditsAndQuotaExceptions):
    def __init__(self):
        message = "Failed to fetch remaining ads quota of today."
        super().__init__(status_code=status.HTTP_404_NOT_FOUND, detail=message)


class RenewDailyAdsQuotaException(UserCreditsAndQuotaExceptions):
    def __init__(self):
        message = "Failed to renew ads quota of today."
        super().__init__(status_code=status.HTTP_409_CONFLICT, detail=message)


class DeductRemainingAdsPerUsageException(UserCreditsAndQuotaExceptions):
    def __init__(self):
        message = "Failed to deduct remaining ads per usage."
        super().__init__(status_code=status.HTTP_409_CONFLICT, detail=message)
