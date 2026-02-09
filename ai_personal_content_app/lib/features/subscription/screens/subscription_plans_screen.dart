import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/core/theme/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlansScreen extends StatelessWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Plans"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Upgrade Your Experience",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontVariations: [FontVariation.weight(800)],
                ),
                textAlign: TextAlign.center,
              ),
              7.verticalSpace,
              Text(
                "Unlock more uploads and searches.\nChat stays unlimited.",
                style: TextStyle(
                  color: AppColors.lightGreyColor,
                  fontSize: 16.sp,
                  fontVariations: [FontVariation.weight(500)],
                ),
                textAlign: TextAlign.center,
              ),
              40.verticalSpace,
              Container(
                padding: EdgeInsets.all(25.w),
                decoration: BoxDecoration(
                  color: AppColors.navyBlueColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontVariations: [FontVariation.weight(700)],
                          ),
                        ),
                        Icon(
                          Icons.card_giftcard,
                          color: AppColors.inactiveColor,
                        ),
                      ],
                    ),
                    Text(
                      "₹ 0",
                      style: TextStyle(
                        fontFamily: APP_FONT_FAMILY,
                        fontSize: 30.sp,
                        fontVariations: [FontVariation.weight(800)],
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    24.verticalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 12.h,
                      children: [
                        _planFeatureWidget("Local-only storage"),
                        _planFeatureWidget("Upload PDFs, images & notes."),
                        _planFeatureWidget("Semantic Search"),
                        _planFeatureWidget("Unlimited chat with contents."),
                        _planFeatureWidget("Recents, pin, sort & filter"),
                      ],
                    ),
                    24.verticalSpace,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18.w),
                      decoration: BoxDecoration(
                        color: AppColors.blueDarkColor,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            spacing: 10.w,
                            children: [
                              databaseIconSvg(color: AppColors.lightGreyColor),
                              Text(
                                "PROCESSING CREDITS",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.lightGreyColor,
                                  fontVariations: [FontVariation.weight(700)],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _planFeatureWidget(String feature) {
    return Row(
      spacing: 12.w,
      children: [
        Icon(Icons.check_circle_outline_outlined, color: AppColors.greenColor),
        Text(
          feature,
          style: TextStyle(
            fontSize: 14.sp,
            fontVariations: [FontVariation.weight(400)],
            color: AppColors.inactiveColor,
          ),
        ),
      ],
    );
  }
}
