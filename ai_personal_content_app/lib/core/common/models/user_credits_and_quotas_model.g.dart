// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credits_and_quotas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCreditsAndQuotasModel _$UserCreditsAndQuotasModelFromJson(
  Map<String, dynamic> json,
) => _UserCreditsAndQuotasModel(
  id: json['id'] as String,
  userId: json['userId'] as String,
  remainingAdsQuotaForToday: (json['remainingAdsQuotaForToday'] as num).toInt(),
  remainingCredits: (json['remainingCredits'] as num).toInt(),
  lastAdWatchTime: (json['lastAdWatchTime'] as num?)?.toInt(),
  lastCreditUseTime: (json['lastCreditUseTime'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserCreditsAndQuotasModelToJson(
  _UserCreditsAndQuotasModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'remainingAdsQuotaForToday': instance.remainingAdsQuotaForToday,
  'remainingCredits': instance.remainingCredits,
  'lastAdWatchTime': instance.lastAdWatchTime,
  'lastCreditUseTime': instance.lastCreditUseTime,
};
