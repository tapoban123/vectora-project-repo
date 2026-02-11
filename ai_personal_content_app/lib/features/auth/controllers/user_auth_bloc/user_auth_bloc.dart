import 'package:ai_personal_content_app/core/common/services/jwt_token_storage_service.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_events.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_states.dart';
import 'package:ai_personal_content_app/features/auth/services/user_authentication_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthBloc extends Bloc<UserAuthEvents, UserAuthStates> {
  final UserAuthenticationServices _userAuthenticationServices;
  final JwtTokenStorageService _jwtTokenStorageService;
  final SharedPreferences _sharedPreferences;

  UserAuthBloc({
    required UserAuthenticationServices userAuthenticationServices,
    required JwtTokenStorageService jwtTokenStorageService,
    required SharedPreferences sharedPreferences,
  }) : _userAuthenticationServices = userAuthenticationServices,
       _jwtTokenStorageService = jwtTokenStorageService,
       _sharedPreferences = sharedPreferences,
       super(UserAuthStates.initial()) {
    on<CheckAuthStatus>(_checkAuthStatus);
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);
  }

  void _checkAuthStatus(CheckAuthStatus event, Emitter emit) async {
    final accessToken = await _jwtTokenStorageService.readAccessToken();
    final user = _userAuthenticationServices.getCurrentUser();
    if (accessToken != null && user != null) {
      emit(UserAuthStates.authenticated(user: user));
    } else {
      emit(UserAuthStates.unauthenticated());
    }
  }

  void _signIn(SignIn event, Emitter emit) async {
    emit(UserAuthStates.loading());
    if (kDebugMode) {
      await _userAuthenticationServices.signOutUser();
    }
    final response = await _userAuthenticationServices.signInUser();

    await response.fold((l) async => emit(UserAuthStates.error(l)), (r) async {
      await _jwtTokenStorageService.writeAccessToken(r);
      final user = _userAuthenticationServices.getCurrentUser();
      if (user != null) {
        emit(UserAuthStates.authenticated(user: user));
      } else {
        emit(UserAuthStates.unauthenticated());
      }
    });
  }

  void _signOut(SignOut event, Emitter emit) async {
    emit(UserAuthStates.loading());
    await _userAuthenticationServices.signOutUser();
    await _jwtTokenStorageService.deleteAllTokens();
    await _sharedPreferences.clear();
    emit(UserAuthStates.unauthenticated());
  }
}
