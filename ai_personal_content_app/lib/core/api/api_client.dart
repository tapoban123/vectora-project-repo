import 'package:ai_personal_content_app/core/api/logger.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;
  late final Dio dio;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:8000",
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {Headers.acceptHeader: Headers.jsonContentType},
        responseType: ResponseType.json,
        validateStatus: (status) =>
            status != null && status >= 200 && status < 500,
      ),
    );

    dio.interceptors.addAll([AppLoggerInterceptor()]);
  }
}
