class ApiException {
  final int? statusCode;
  final String message;

  ApiException({this.statusCode, required this.message});
}

class NoInternetConnectionException extends ApiException {
  NoInternetConnectionException() : super(message: "No Internet Connection");
}

class SendTimeoutException extends ApiException {
  SendTimeoutException() : super(message: "The server cannot be reached.");
}

class ReceiveTimeoutException extends ApiException {
  ReceiveTimeoutException()
    : super(message: "The server took too long to respond.");
}

class CustomApiException extends ApiException {
  CustomApiException({required super.message, super.statusCode});
}
