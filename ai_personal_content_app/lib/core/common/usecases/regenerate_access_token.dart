import 'package:ai_personal_content_app/core/common/services/jwt_token_storage_service.dart';
import 'package:ai_personal_content_app/features/auth/services/user_authentication_services.dart';

class RegenerateAccessToken {
  final UserAuthenticationServices _userAuthenticationServices;
  final JwtTokenStorageService _jwtTokenStorageService;

  RegenerateAccessToken({
    required UserAuthenticationServices userAuthenticationServices,
    required JwtTokenStorageService jwtTokenStorageService,
  }) : _userAuthenticationServices = userAuthenticationServices,
       _jwtTokenStorageService = jwtTokenStorageService;

  Future<bool> call() async {
    final res = await _userAuthenticationServices.regenerateAccessToken();
    return await res.fold(
      (l) => false,
      (r) async {
        await _jwtTokenStorageService.writeAccessToken(r);
        return true;
      },
    );
  }
}
