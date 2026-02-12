import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credits_and_quotas_model.freezed.dart';

part 'user_credits_and_quotas_model.g.dart';

@freezed
abstract class UserCreditsAndQuotasModel with _$UserCreditsAndQuotasModel {
  factory UserCreditsAndQuotasModel({
    required String id,
    required String userId,
    required int remainingAdsQuotaForToday,
    required double remainingCredits,
    int? lastAdWatchTime,
    int? lastCreditUseTime,
  }) = _UserCreditsAndQuotasModel;

  factory UserCreditsAndQuotasModel.fromJson(Map<String, dynamic> json) =>
      _$UserCreditsAndQuotasModelFromJson(json);
}
