import 'package:firebase_auth/firebase_auth.dart';

class ReadRefreshToken {
  final FirebaseAuth _firebaseAuth;

  ReadRefreshToken({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  Future<String?> call() async {
    return await _firebaseAuth.currentUser!.getIdToken();
  }
}
