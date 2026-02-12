import 'package:ai_personal_content_app/core/common/models/user_credits_and_quotas_model.dart';
import 'package:ai_personal_content_app/core/common/services/credits_and_quotas_local_storage.dart';
import 'package:ai_personal_content_app/core/common/services/credits_and_quotas_services.dart';
import 'package:ai_personal_content_app/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditsAndQuotasCubit extends Cubit<UserCreditsAndQuotasModel?> {
  final CreditsAndQuotasServices _creditsAndQuotasServices;
  final CreditsAndQuotasLocalStorage _creditsAndQuotasLocalStorage;

  CreditsAndQuotasCubit({
    required CreditsAndQuotasServices creditsAndQuotasServices,
    required CreditsAndQuotasLocalStorage creditsAndQuotasLocalStorage,
  }) : _creditsAndQuotasLocalStorage = creditsAndQuotasLocalStorage,
       _creditsAndQuotasServices = creditsAndQuotasServices,
       super(null);

  void fetchCreditsAndQuotas() async {
    UserCreditsAndQuotasModel? creditsData = _creditsAndQuotasLocalStorage
        .getCreditsAndQuotasData();
    if (creditsData == null) {
      final res = await _creditsAndQuotasServices.fetchUserCreditsAndQuotas();
      await res.fold((l) async => 0, (r) async {
        _creditsAndQuotasLocalStorage.saveCreditsAndQuotasData(r);
        creditsData = r;
      });
    }
    emit(creditsData!);
  }

  void deductCreditsOnUsage({
    required CreditsUsageType usage,
    required int creditsToDeduct,
  }) {}

  void grantRewardOnAdWatch() async {
    final UserCreditsAndQuotasModel updatedCreditsData = state!.copyWith(
      remainingCredits: state!.remainingCredits + 15,
      remainingAdsQuotaForToday: state!.remainingAdsQuotaForToday - 1,
    );
    await _creditsAndQuotasServices.grantRewardOnAdWatch(
      remainingCredits: updatedCreditsData.remainingCredits,
      remainingAdsQuota: updatedCreditsData.remainingAdsQuotaForToday,
    );
    emit(updatedCreditsData);
  }
}
