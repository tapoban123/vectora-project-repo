import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/core/theme/app_svgs.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
              _FreePlanWidget(),
              24.verticalSpace,
              _PremiumPlanWidget(),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _PremiumPlanWidget extends StatelessWidget {
  const _PremiumPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
            ),
          ),
          child: Text(
            "RECOMMENDED",
            style: TextStyle(
              fontSize: 10.sp,
              fontVariations: [FontVariation.weight(800)],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(25.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.blueColor.withValues(alpha: 0.2),
                AppColors.blueColor.withValues(alpha: 0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: AppColors.blueColor, width: 2.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Premium",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontVariations: [FontVariation.weight(700)],
                    ),
                  ),
                  Icon(
                    Icons.workspace_premium_outlined,
                    color: AppColors.blueColor,
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: "₹ 149",
                  style: TextStyle(
                    fontFamily: APP_FONT_FAMILY,
                    fontSize: 30.sp,
                    fontVariations: [FontVariation.weight(800)],
                    color: Colors.white,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: " /month",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontVariations: [FontVariation.weight(500)],
                        color: AppColors.inactiveColor,
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 12.h,
                children: [
                  _premiumFeatureWidget("Everything is free."),
                  _premiumFeatureWidget("2,000 processing credits / month."),
                  _premiumFeatureWidget("No Ads. Ever."),
                ],
              ),
              24.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: AppColors.blueDarkColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MONTHLY QUOTA",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontVariations: [FontVariation.weight(500)],
                      ),
                    ),
                    5.verticalSpace,
                    SizedBox(
                      width: getScreenWidth(context) * 0.6,
                      child: Text(
                        "2,000 credits = 1,000 uploads or 4,000 searches",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontVariations: [FontVariation.weight(400)],
                          color: AppColors.inactiveColor,
                          fontFamily: APP_FONT_FAMILY,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              32.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  context.push(RouteNames.checkout);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueColor,
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  splashFactory: InkSplash.splashFactory,
                  overlayColor: AppColors.greyColor,
                ),
                child: Text(
                  "Upgrade to Premium",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontVariations: [FontVariation.weight(600)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _premiumFeatureWidget(String feature) {
    return Row(
      spacing: 12.w,
      children: [
        Icon(Icons.verified_outlined, color: AppColors.blueColor),
        Text(
          feature,
          style: TextStyle(
            fontSize: 14.sp,
            fontVariations: [FontVariation.weight(500)],
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _FreePlanWidget extends StatelessWidget {
  const _FreePlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(26.w),
      decoration: BoxDecoration(
        color: AppColors.navyBlueColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
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
              Icon(Icons.card_giftcard, color: AppColors.inactiveColor),
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
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10.w,
                  children: [
                    databaseIconSvg(color: Colors.white.withValues(alpha: 0.6)),
                    Text(
                      "PROCESSING CREDITS",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withValues(alpha: 0.6),
                        fontVariations: [FontVariation.weight(700)],
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: "40 credits included",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontVariations: [FontVariation.weight(600)],
                      color: Colors.white,
                      fontFamily: APP_FONT_FAMILY,
                      height: 2,
                    ),
                    children: [
                      TextSpan(
                        text: " (one-time)",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontVariations: [FontVariation.weight(500)],
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                14.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 6.w,
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.blueColor,
                          size: 10.w,
                        ),
                        Text(
                          "Upload = 2 credits",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.inactiveColor,
                            fontVariations: [FontVariation.weight(400)],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 6.w,
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.blueColor,
                          size: 10.w,
                        ),
                        Text(
                          "Search = 0.5 credits",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.inactiveColor,
                            fontVariations: [FontVariation.weight(400)],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                12.verticalSpace,
                Text(
                  "40 credits = 20 uploads or 80 searches",
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.inactiveColor,
                    fontVariations: [FontVariation.weight(400)],
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
              color: AppColors.blueDarkColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Watch a short ad → +15 credits",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontVariations: [FontVariation.weight(500)],
                      ),
                    ),
                    Text(
                      "Up to 3 ads per day.",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.inactiveColor,
                        fontVariations: [FontVariation.weight(400)],
                      ),
                    ),
                  ],
                ),
                Icon(Icons.play_circle_outline, color: AppColors.inactiveColor),
              ],
            ),
          ),
          24.verticalSpace,
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.greyColor,
              minimumSize: Size(double.infinity, 52.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              splashFactory: InkSplash.splashFactory,
              overlayColor: AppColors.lightGreyColor,
            ),
            child: Text(
              "Current Plan",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.lightGreyColor,
                fontVariations: [FontVariation.weight(600)],
              ),
            ),
          ),
        ],
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
