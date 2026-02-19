import 'dart:io';

import 'package:ai_personal_content_app/core/api/api_client.dart';
import 'package:ai_personal_content_app/core/api/api_exceptions.dart';
import 'package:ai_personal_content_app/core/api/api_routes.dart';
import 'package:ai_personal_content_app/core/api/logger.dart';
import 'package:ai_personal_content_app/core/common/usecases/read_access_token.dart';
import 'package:ai_personal_content_app/core/common/usecases/regenerate_access_token.dart';
import 'package:ai_personal_content_app/features/subscription/models/payment_order_id_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class PaymentServices {
  final Dio _dio = ApiClient().dio;
  final ReadAccessToken _readAccessToken;
  final RegenerateAccessToken _regenerateAccessToken;

  PaymentServices({
    required ReadAccessToken readAccessToken,
    required RegenerateAccessToken regenerateAccessToken,
  }) : _regenerateAccessToken = regenerateAccessToken,
       _readAccessToken = readAccessToken;

  Future<Either<ApiException, PaymentOrderIdModel>> generatePaymentOrderId({
    bool isRetry = false,
  }) async {
    try {
      final String? accessToken = await _readAccessToken.call();
      final response = await _dio.get(
        ApiRoutes.generatePaymentOrderId,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        return Right(PaymentOrderIdModel.fromJson(response.data));
      }

      if (response.statusCode == HttpStatus.unauthorized && !isRetry) {
        final bool isAccessTokenRenewed = await _regenerateAccessToken.call();
        if (isAccessTokenRenewed) {
          return generatePaymentOrderId(isRetry: true);
        }
        return Left(
          CustomApiException(
            message: "Failed to regenerate access token.",
            statusCode: HttpStatus.unauthorized,
          ),
        );
      }

      return Left(
        CustomApiException(
          message: response.statusMessage ?? "An error has occurred.",
          statusCode: response.statusCode,
        ),
      );
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.sendTimeout:
          return Left(SendTimeoutException());
        case DioExceptionType.receiveTimeout:
          return Left(ReceiveTimeoutException());
        default:
          return Left(
            CustomApiException(
              message: e.message.toString(),
              statusCode: e.response?.statusCode,
            ),
          );
      }
    } on SocketException catch (e) {
      return Left(NoInternetConnectionException());
    } catch (e, stk) {
      logNetworkError("GENERATE PAYMENT ORDER ID ERROR", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }
}
