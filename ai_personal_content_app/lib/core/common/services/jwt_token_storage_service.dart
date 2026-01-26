import 'package:ai_personal_content_app/features/auth/models/auth_tokens.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtTokenStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );
  final String _ACCESS_TOKEN_KEY = "ACCESS-TOKEN";
  final String _REFRESH_TOKEN_KEY = "REFRESH-TOKEN";

  Future<void> writeAuthTokens(AuthTokens tokens) async {
    final future1 = _storage.write(
      key: _REFRESH_TOKEN_KEY,
      value: tokens.refreshToken,
    );
    final future2 = _storage.write(
      key: _ACCESS_TOKEN_KEY,
      value: tokens.accessToken,
    );
    await Future.wait([future1, future2]);
  }

  Future<void> writeAccessToken(String accessToken) async {
    await _storage.write(key: _ACCESS_TOKEN_KEY, value: accessToken);
  }

  Future<void> writeRefreshToken(String refreshToken) async {
    await _storage.write(key: _REFRESH_TOKEN_KEY, value: refreshToken);
  }

  Future<String?> readAccessToken() async {
    return await _storage.read(key: _ACCESS_TOKEN_KEY);
  }

  Future<String?> readRefreshToken() async {
    return await _storage.read(key: _REFRESH_TOKEN_KEY);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _ACCESS_TOKEN_KEY);
  }

  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _REFRESH_TOKEN_KEY);
  }

  Future<void> deleteAllTokens() async {
    await _storage.deleteAll();
  }
}
