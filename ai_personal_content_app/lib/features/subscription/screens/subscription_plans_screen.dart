import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontVariations: [FontVariation.weight(600)],
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
      ),
    );
  }
}
