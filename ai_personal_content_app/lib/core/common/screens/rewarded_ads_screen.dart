import 'package:ai_personal_content_app/core/constants/env_values.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdsScreen extends StatefulWidget {
  const RewardedAdsScreen({super.key});

  @override
  State<RewardedAdsScreen> createState() => _RewardedAdsScreenState();
}

class _RewardedAdsScreenState extends State<RewardedAdsScreen> {
  late RewardedAd? _rewardedAd;
  late bool _isAdLoading;

  void _loadAd() {
    RewardedAd.load(
      adUnitId: kDebugMode ? AD_UNIT_ID_DEV : AD_UNIT_ID_PROD,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          setState(() {
            _isAdLoading = false;
          });
          // Called when an ad is successfully received.
          debugPrint('Ad was loaded.');
          // Keep a reference to the ad so you can show it later.
          _rewardedAd = ad;
          _showAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          // Called when an ad request failed.
          setState(() {
            _isAdLoading = false;
          });
          debugPrint('Ad failed to load with error: $error');
        },
      ),
    );
  }

  void _showAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {
          // Called when the ad showed the full screen content.
          debugPrint('Ad showed full screen content.');
        },
        onAdFailedToShowFullScreenContent: (ad, err) {
          // Called when the ad failed to show full screen content.
          debugPrint('Ad failed to show full screen content with error: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        onAdDismissedFullScreenContent: (ad) {
          // Called when the ad dismissed full screen content.
          debugPrint('Ad was dismissed.');
          // Dispose the ad here to free resources.
          ad.dispose();
          context.pop();
        },
        onAdImpression: (ad) {
          // Called when an impression occurs on the ad.
          debugPrint('Ad recorded an impression.');
        },
        onAdClicked: (ad) {
          // Called when a click is recorded for an ad.
          debugPrint('Ad was clicked.');
        },
      );

      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
          debugPrint('Reward amount: ${rewardItem.amount}');
        },
      );
    }
  }

  @override
  void initState() {
    _isAdLoading = true;
    _loadAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isAdLoading
            ? CircularProgressIndicator(color: AppColors.offWhiteColor)
            : SizedBox.shrink(),
      ),
    );
  }
}
