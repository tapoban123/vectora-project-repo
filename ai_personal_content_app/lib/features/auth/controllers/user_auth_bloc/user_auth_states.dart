import 'package:ai_personal_content_app/core/api/api_exceptions.dart';
import 'package:ai_personal_content_app/features/auth/models/user_profile_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth_states.freezed.dart';

@freezed
abstract class UserAuthStates with _$UserAuthStates {
  factory UserAuthStates.initial() = _Initial;

  factory UserAuthStates.authenticated({required UserProfileDetails user}) = _Authenticated;

  factory UserAuthStates.unauthenticated() = _Unauthenticated;

  factory UserAuthStates.loading() = _Loading;

  factory UserAuthStates.error(ApiException exception) = _Error;
}
