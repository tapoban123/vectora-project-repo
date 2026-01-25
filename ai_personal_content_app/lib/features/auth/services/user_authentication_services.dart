import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:ai_personal_content_app/core/api/api_client.dart';
import 'package:ai_personal_content_app/core/api/api_routes.dart';
import 'package:ai_personal_content_app/core/constants/env_values.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Dio _dio = ApiClient().dio;

  Future<void> signInUser() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(serverClientId: GOOGLE_SERVICE_CLIENT_ID);
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      final String? firebaseIdToken = await userCredential.user?.getIdToken();
      log(firebaseIdToken.toString());
      final response = await _dio.get(
        ApiRoutes.signIn,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $firebaseIdToken"},
        ),
      );
      if (response.statusCode == 200) {
        log(response.data.toString());
      }
    } on GoogleSignInException catch (e) {
      switch (e.code) {
        case GoogleSignInExceptionCode.canceled:
          log("Sign in cancelled.");
        default:
      }
    } catch (e) {
      log("[SIGN IN ERROR] $e");
    }
  }

  Future<void> signOutUser() async {
    log(_firebaseAuth.currentUser.toString());
    await _firebaseAuth.signOut();
    log(_firebaseAuth.currentUser.toString());
  }
}
