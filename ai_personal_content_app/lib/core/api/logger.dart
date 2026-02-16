import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class AppLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("┌──────────────────────── REQUEST ────────────────────────");
    log("│ URL: ${options.uri}");
    log("│ METHOD: ${options.method}");
    log("│ HEADERS: ${_prettyJson(options.headers)}");
    log("│ Query Parameters: ${_prettyJson(options.queryParameters)}");

    if (options.data != null) {
      log("│ BODY:\n${_prettyJson(options.data)}");
    }

    log("└──────────────────────────────────────────────────────────");

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log("┌──────────────────────── RESPONSE ────────────────────────");
    log("│ URL: ${response.requestOptions.uri}");
    log("│ STATUS: ${response.statusCode}");
    log("│ DATA:\n${_prettyJson(response.data)}");
    log("└──────────────────────────────────────────────────────────");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("┌──────────────────────── ERROR ───────────────────────────");
    log("│ URL: ${err.requestOptions.uri}");
    log("│ TYPE: ${err.type}");
    log("│ MESSAGE: ${err.message}");
    if (err.response?.data != null) {
      log("│ RESPONSE DATA:\n${_prettyJson(err.response?.data)}");
    }
    log("└──────────────────────────────────────────────────────────");
    handler.next(err);
  }

  String _prettyJson(dynamic jsonObject) {
    try {
      const encoder = JsonEncoder.withIndent("  ");
      return encoder.convert(jsonObject);
    } catch (e) {
      return jsonObject.toString();
    }
  }
}

void logNetworkError(String title, String errMsg, StackTrace stk) {
  log("-" * 15);
  log(errMsg, name: title, stackTrace: stk);
  log("-" * 15);
}
