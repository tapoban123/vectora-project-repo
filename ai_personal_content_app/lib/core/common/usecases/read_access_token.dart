import 'package:ai_personal_content_app/core/common/services/jwt_token_storage_service.dart';

class ReadAccessToken {
  final JwtTokenStorageService _jwtTokenStorageService;

  ReadAccessToken({required JwtTokenStorageService jwtTokenStorageService})
    : _jwtTokenStorageService = jwtTokenStorageService;

  Future<String?> call() async {
    return await _jwtTokenStorageService.readAccessToken();
  }
}
