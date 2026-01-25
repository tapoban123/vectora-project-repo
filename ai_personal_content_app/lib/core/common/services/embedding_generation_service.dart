import 'dart:convert';
import 'dart:io';

import 'package:ai_personal_content_app/core/api/api_client.dart';
import 'package:ai_personal_content_app/core/api/api_routes.dart';
import 'package:ai_personal_content_app/core/api/api_exceptions.dart';
import 'package:ai_personal_content_app/core/api/logger.dart';
import 'package:ai_personal_content_app/features/home/models/content_embedding_response_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class EmbeddingGenerationService {
  final Dio _dio = ApiClient().dio;

  Future<Either<ApiException, ContentEmbeddingResponseModel>>
  generateImageEmbeddings({
    String? cid,
    String? contentType,
    required File image,
    required Function(int count, int total) onReceiveProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        "cid": cid,
        "contentType": contentType,
        "image": await MultipartFile.fromFile(image.path),
      });
      final response = await _dio.post(
        ApiRoutes.generateImageEmbeddings,
        data: formData,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        return Right(ContentEmbeddingResponseModel.fromJson(response.data));
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
    Function(int count, int total)? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        ApiRoutes.generateTextEmbeddings,
        data: jsonEncode({
          "cid": cid,
          "contentType": contentType,
          "text": text,
        }),
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        return Right(ContentEmbeddingResponseModel.fromJson(response.data));
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
    Function(int count, int total)? onReceiveProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        "cid": cid,
        "contentType": contentType,
        "pdf": await MultipartFile.fromFile(pdf.path),
      });
      final response = await _dio.post(
        ApiRoutes.generatePdfEmbeddings,
        data: formData,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        return Right(ContentEmbeddingResponseModel.fromJson(response.data));
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
