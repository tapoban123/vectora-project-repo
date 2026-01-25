import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:ai_personal_content_app/core/api/api_client.dart';
import 'package:ai_personal_content_app/core/api/api_exceptions.dart';
import 'package:ai_personal_content_app/core/api/api_routes.dart';
import 'package:ai_personal_content_app/core/api/logger.dart';
import 'package:ai_personal_content_app/core/constants/env_values.dart';
import 'package:ai_personal_content_app/features/auth/models/auth_tokens.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Dio _dio = ApiClient().dio;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<Either<ApiException, AuthTokens>> signInUser() async {
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
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $firebaseIdToken"},
        ),
      );
      if (response.statusCode == 200) {
        // return profile details from server on successful authentication.
        return Right(AuthTokens.fromJson(response.data));
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
        default:
          return Left(
            CustomApiException(message: "Failed to continue sign in process."),
          );
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

  Future<void> signOutUser() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e, stk) {
      logNetworkError("[SIGN IN ERROR]", e.toString(), stk);
    }
  }
}
