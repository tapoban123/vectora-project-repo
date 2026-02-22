import 'dart:convert';
import 'dart:io';

import 'package:ai_personal_content_app/core/api/api_client.dart';
import 'package:ai_personal_content_app/core/api/api_routes.dart';
import 'package:ai_personal_content_app/core/api/api_exceptions.dart';
import 'package:ai_personal_content_app/core/api/logger.dart';
import 'package:ai_personal_content_app/core/common/usecases/read_access_token.dart';
import 'package:ai_personal_content_app/core/common/usecases/regenerate_access_token.dart';
import 'package:ai_personal_content_app/features/home/models/content_embedding_response_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class EmbeddingGenerationService {
  final Dio _dio = ApiClient().dio;

  final ReadAccessToken _readAccessToken;
  final RegenerateAccessToken _regenerateAccessToken;

  EmbeddingGenerationService({
    required ReadAccessToken readAccessToken,
    required RegenerateAccessToken regenerateAccessToken,
  }) : _readAccessToken = readAccessToken,
       _regenerateAccessToken = regenerateAccessToken;

  Future<Either<ApiException, ContentEmbeddingResponseModel>>
  generateImageEmbeddings({
    String? cid,
    String? contentType,
    required File image,
    required Function(int count, int total) onSendProgress,
    required Function(int count, int total) onReceiveProgress,
    bool isRetry = false,
  }) async {
    try {
      final String? accessToken = await _readAccessToken();
      final formData = FormData.fromMap({
        "cid": cid,
        "contentType": contentType,
        "image": await MultipartFile.fromFile(image.path),
      });
      final response = await _dio.post(
        ApiRoutes.generateImageEmbeddings,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
          receiveTimeout: Duration(minutes: 3),
        ),
        data: formData,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      if (response.statusCode == 200) {
        return Right(ContentEmbeddingResponseModel.fromJson(response.data));
      }
      if (response.statusCode == HttpStatus.unauthorized && !isRetry) {
        final isRegeneratedAccessToken = await _regenerateAccessToken();
        if (isRegeneratedAccessToken) {
          return generateImageEmbeddings(
            image: image,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
            isRetry: true,
          );
        }
        return Left(
          CustomApiException(
            message: "Failed to generate access token for user.",
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
      logNetworkError("GENERATE IMAGE EMBEDDINGS ERROR", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }

  Future<Either<ApiException, ContentEmbeddingResponseModel>>
  generateTextEmbeddings({
    String? cid,
    String? contentType,
    required String text,
    Function(int count, int total)? onSendProgress,
    Function(int count, int total)? onReceiveProgress,
    bool isRetry = false,
  }) async {
    try {
      final String? accessToken = await _readAccessToken();
      final response = await _dio.post(
        ApiRoutes.generateTextEmbeddings,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
          receiveTimeout: Duration(minutes: 5),
        ),
        data: jsonEncode({
          "cid": cid,
          "contentType": contentType,
          "text": text,
        }),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      if (response.statusCode == 200) {
        return Right(ContentEmbeddingResponseModel.fromJson(response.data));
      }
      if (response.statusCode == HttpStatus.unauthorized && !isRetry) {
        final isRegeneratedAccessToken = await _regenerateAccessToken();
        if (isRegeneratedAccessToken) {
          return generateTextEmbeddings(text: text, isRetry: true);
        }
        return Left(
          CustomApiException(
            message: "Failed to generate access token for user.",
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
      logNetworkError("GENERATE TEXT EMBEDDINGS ERROR", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }

  Future<Either<ApiException, ContentEmbeddingResponseModel>>
  generatePdfEmbeddings({
    String? cid,
    String? contentType,
    required File pdf,
    required Function(int count, int total) onReceiveProgress,
    required Function(int count, int total) onSendProgress,
    bool isRetry = false,
  }) async {
    try {
      final String? accessToken = await _readAccessToken();
      final formData = FormData.fromMap({
        "cid": cid,
        "contentType": contentType,
        "pdf": await MultipartFile.fromFile(pdf.path),
      });
      final response = await _dio.post(
        ApiRoutes.generatePdfEmbeddings,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
          receiveTimeout: Duration(minutes: 5),
        ),
        data: formData,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      if (response.statusCode == 200) {
        return Right(ContentEmbeddingResponseModel.fromJson(response.data));
      }
      if (response.statusCode == HttpStatus.unauthorized && !isRetry) {
        final isRegeneratedAccessToken = await _regenerateAccessToken();
        if (isRegeneratedAccessToken) {
          return generatePdfEmbeddings(
            pdf: pdf,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
            isRetry: true,
          );
        }
        return Left(
          CustomApiException(
            message: "Failed to generate access token for user.",
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
      logNetworkError("GENERATE PDF EMBEDDINGS ERROR", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }
}
