import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth_events.freezed.dart';

@freezed
abstract class UserAuthEvents with _$UserAuthEvents {
  factory UserAuthEvents.signIn() = SignIn;

  factory UserAuthEvents.signOut() = SignOut;
}
