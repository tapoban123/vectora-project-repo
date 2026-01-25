// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileDetails _$UserProfileDetailsFromJson(Map<String, dynamic> json) =>
    _UserProfileDetails(
      userId: json['userId'] as String,
      name: json['name'] as String,
      profilePicture: json['profilePicture'] as String,
      creationTime: (json['creationTime'] as num).toInt(),
      email: json['email'] as String,
      subscriptionType: $enumDecode(
        _$SubscriptionTypesEnumMap,
        json['subscriptionType'],
      ),
      paymentDate: json['paymentDate'] as String?,
    );

Map<String, dynamic> _$UserProfileDetailsToJson(
  _UserProfileDetails instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'name': instance.name,
  'profilePicture': instance.profilePicture,
  'creationTime': instance.creationTime,
  'email': instance.email,
  'subscriptionType': _$SubscriptionTypesEnumMap[instance.subscriptionType]!,
  'paymentDate': instance.paymentDate,
};

const _$SubscriptionTypesEnumMap = {
  SubscriptionTypes.FREE: 'FREE',
  SubscriptionTypes.BASIC: 'BASIC',
  SubscriptionTypes.PREMIUM: 'PREMIUM',
};
