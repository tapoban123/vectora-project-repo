import 'dart:convert';
import 'dart:io';

import 'package:ai_personal_content_app/core/api/api_client.dart';
import 'package:ai_personal_content_app/core/api/api_exceptions.dart';
import 'package:ai_personal_content_app/core/api/api_routes.dart';
import 'package:ai_personal_content_app/core/api/logger.dart';
import 'package:ai_personal_content_app/core/common/models/user_credits_and_quotas_model.dart';
import 'package:ai_personal_content_app/core/common/usecases/read_access_token.dart';
import 'package:ai_personal_content_app/core/common/usecases/regenerate_access_token.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class CreditsAndQuotasServices {
  final Dio _dio = ApiClient().dio;
  final ReadAccessToken _readAccessToken;
  final RegenerateAccessToken _regenerateAccessToken;

  CreditsAndQuotasServices({
    required ReadAccessToken readAccessToken,
    required RegenerateAccessToken regenerateAccessToken,
  }) : _readAccessToken = readAccessToken,
       _regenerateAccessToken = regenerateAccessToken;

  Future<Either<ApiException, UserCreditsAndQuotasModel>>
  fetchUserCreditsAndQuotas({bool isRetry = false}) async {
    try {
      final String? accessToken = await _readAccessToken.call();
      final response = await _dio.get(
        ApiRoutes.fetchUserCreditsAndQuotas,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        return Right(UserCreditsAndQuotasModel.fromJson(response.data));
      }

      if (response.statusCode == HttpStatus.unauthorized && !isRetry) {
        final isAccessTokenRenewed = await _regenerateAccessToken();
        if (isAccessTokenRenewed) {
          return fetchUserCreditsAndQuotas(isRetry: true);
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
      logNetworkError("FETCH USER CREDITS & QUOTAS ERROR", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }

  Future<Either<ApiException, dynamic>> updateRemainingCreditsOnUsage({
    bool isRetry = false,
    required double remainingCredits,
  }) async {
    try {
      final String? accessToken = await _readAccessToken.call();
      final response = await _dio.get(
        ApiRoutes.updateRemainingCreditsOnUsage,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
        ),
        data: jsonEncode({"remaining_credits": remainingCredits}),
      );

      if (response.statusCode == HttpStatus.ok) {
        return Right(response.data);
      }

      if (response.statusCode == HttpStatus.unauthorized && !isRetry) {
        final isAccessTokenRenewed = await _regenerateAccessToken();
        if (isAccessTokenRenewed) {
          return fetchUserCreditsAndQuotas(isRetry: true);
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
      logNetworkError("UPDATE USER CREDITS ON USAGE ERROR", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }

  Future grantRewardOnAdWatch({
    bool isRetry = false,
    required double remainingCredits,
    required int remainingAdsQuota,
  }) async {
    try {
      final String? accessToken = await _readAccessToken.call();
      final response = await _dio.get(
        ApiRoutes.grantCreditsOnAdWatch,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
        ),
        data: jsonEncode({
          "remaining_credits": remainingCredits,
          "remaining_ads_quota": remainingAdsQuota,
        }),
      );

      if (response.statusCode == HttpStatus.ok) {
        return Right(response.data);
      }

      if (response.statusCode == HttpStatus.unauthorized && !isRetry) {
        final isAccessTokenRenewed = await _regenerateAccessToken();
        if (isAccessTokenRenewed) {
          return fetchUserCreditsAndQuotas(isRetry: true);
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
      logNetworkError("GRANT REWARD ON AD WATCH ERROR", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }

  Future fetchRemainingDailyAdsQuota() async {
    throw UnimplementedError();
  }
}
