import 'package:ai_personal_content_app/core/common/services/jwt_token_storage_service.dart';

class ReadRefreshToken {
  final JwtTokenStorageService _jwtTokenStorageService;

  ReadRefreshToken({required JwtTokenStorageService jwtTokenStorageService})
    : _jwtTokenStorageService = jwtTokenStorageService;

  Future<String?> call() async {
    return await _jwtTokenStorageService.readRefreshToken();
  }
}
