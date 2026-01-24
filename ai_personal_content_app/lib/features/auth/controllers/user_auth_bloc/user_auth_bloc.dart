import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_events.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_states.dart';
import 'package:ai_personal_content_app/features/auth/services/user_authentication_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAuthBloc extends Bloc<UserAuthEvents, UserAuthStates> {
  final UserAuthenticationServices _userAuthenticationServices;

  UserAuthBloc({required UserAuthenticationServices userAuthenticationServices})
    : _userAuthenticationServices = userAuthenticationServices,
      super(UserAuthStates.initial()) {
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);
  }

  void _signIn(SignIn event, Emitter emit) async {
    _userAuthenticationServices.signInUser();
  }

  void _signOut(SignOut event, Emitter emit) async {}
}
