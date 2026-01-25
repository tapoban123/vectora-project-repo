import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_details.g.dart';

part 'user_profile_details.freezed.dart';

enum SubscriptionTypes { FREE, BASIC, PREMIUM }

@freezed
abstract class UserProfileDetails with _$UserProfileDetails {
  factory UserProfileDetails({
    required String userId,
    required String name,
    required String profilePicture,
    required int creationTime,
    required String email,
    required SubscriptionTypes subscriptionType,
    String? paymentDate,
  }) = _UserProfileDetails;

  factory UserProfileDetails.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDetailsFromJson(json);
}
