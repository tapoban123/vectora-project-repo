import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_details.freezed.dart';

enum SubscriptionTypes { FREE, BASIC, PREMIUM }

@freezed
abstract class UserProfileDetails with _$UserProfileDetails {
  factory UserProfileDetails({
    required String userId,
    required String name,
    required String profilePicture,
    required DateTime creationTime,
    required String email,
  }) = _UserProfileDetails;
}
