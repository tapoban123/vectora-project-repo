import 'package:ai_personal_content_app/core/api/logger.dart';
import 'package:ai_personal_content_app/core/constants/env_values.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;
  late final Dio dio;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        // baseUrl: "http://10.0.2.2:8000",
        baseUrl: API_BASE_URL,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {Headers.acceptHeader: Headers.jsonContentType},
        responseType: ResponseType.json,
        validateStatus: (status) =>
            status != null && status >= 200 && status < 500,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.addAll([AppLoggerInterceptor()]);
    }
  }
}
