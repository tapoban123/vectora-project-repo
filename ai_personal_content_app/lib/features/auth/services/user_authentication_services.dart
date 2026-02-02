import 'dart:async';
import 'dart:io';

import 'package:ai_personal_content_app/core/api/api_client.dart';
import 'package:ai_personal_content_app/core/api/api_exceptions.dart';
import 'package:ai_personal_content_app/core/api/api_routes.dart';
import 'package:ai_personal_content_app/core/api/logger.dart';
import 'package:ai_personal_content_app/core/constants/env_values.dart';
import 'package:ai_personal_content_app/features/auth/models/user_profile_details.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthenticationServices {
  final FirebaseAuth _firebaseAuth;
  final Dio _dio = ApiClient().dio;

  UserAuthenticationServices({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  UserProfileDetails? getCurrentUser() {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      return UserProfileDetails(
        userId: currentUser.uid,
        name: currentUser.displayName!,
        profilePicture: currentUser.photoURL!,
        creationTime: currentUser.metadata.creationTime!,
        email: currentUser.email!,
      );
    }
    return null;
  }

  Future<Either<ApiException, String>> signInUser() async {
    try {
      // initialise google sign in
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(serverClientId: GOOGLE_SERVICE_CLIENT_ID);
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // log in to firebase
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      final String? firebaseIdToken = await userCredential.user?.getIdToken();

      // send firebase token to backend.
      final response = await _dio.get(
        ApiRoutes.signIn,
        options: Options(headers: {"Authorization": "Bearer $firebaseIdToken"}),
      );
      if (response.statusCode == 200) {
        // return access token from server on successful authentication.
        return Right(response.data["access_token"]);
      }
      return Left(
        CustomApiException(
          statusCode: response.statusCode,
          message: response.statusMessage.toString(),
        ),
      );
    } on SocketException {
      return Left(NoInternetConnectionException());
    } on GoogleSignInException catch (e) {
      switch (e.code) {
        case GoogleSignInExceptionCode.canceled:
          return Left(
            CustomApiException(message: "Sign in process cancelled."),
          );
        case GoogleSignInExceptionCode.clientConfigurationError:
          return Left(CustomApiException(message: e.description.toString()));
        default:
          return Left(CustomApiException(message: e.description.toString()));
      }
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
    } catch (e, stk) {
      logNetworkError("[SIGN IN ERROR]", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }

  Future<Either<ApiException, String>> regenerateAccessToken() async {
    try {
      // Get firebase id token.
      final String? firebaseIdToken = await _firebaseAuth.currentUser
          ?.getIdToken();

      // send firebase token to backend.
      final response = await _dio.get(
        ApiRoutes.generateNewAccessToken,
        options: Options(headers: {"Authorization": "Bearer $firebaseIdToken"}),
      );
      if (response.statusCode == 200) {
        // return access token from server on successful authentication.
        return Right(response.data["access_token"]);
      }
      return Left(
        CustomApiException(
          statusCode: response.statusCode,
          message: response.statusMessage.toString(),
        ),
      );
    } on SocketException {
      return Left(NoInternetConnectionException());
    } on GoogleSignInException catch (e) {
      switch (e.code) {
        case GoogleSignInExceptionCode.canceled:
          return Left(
            CustomApiException(message: "Access token regeneration failed."),
          );
        case GoogleSignInExceptionCode.clientConfigurationError:
          return Left(CustomApiException(message: e.description.toString()));
        default:
          return Left(CustomApiException(message: e.description.toString()));
      }
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
    } catch (e, stk) {
      logNetworkError("[ACCESS TOKEN REGENERATION ERROR]", e.toString(), stk);
      return Left(CustomApiException(message: e.toString()));
    }
  }

  Future<void> signOutUser() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e, stk) {
      logNetworkError("[SIGN OUT ERROR]", e.toString(), stk);
    }
  }
}
