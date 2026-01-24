import 'dart:async';
import 'dart:developer';

import 'package:ai_personal_content_app/core/api/api_client.dart';
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
      log(userCredential.user!.displayName.toString());
      log(userCredential.user!.email.toString());
      log(userCredential.user!.photoURL.toString());
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
