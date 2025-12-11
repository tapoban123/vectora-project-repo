import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/features/auth/widgets/custom_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.backgroundColor,
        statusBarColor: AppColors.backgroundColor,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(24.w),
                          child: Icon(Icons.menu_book_rounded, size: 50.w),
                        ),
                      ),
                      30.verticalSpace,
                      Text(
                        "Your personal content\nuniverse.",
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontVariations: [FontVariation.weight(800)],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      12.verticalSpace,
                      Text(
                        "Seamlessly manage and search\neverything.",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.inactiveColor,
                          fontVariations: [FontVariation.weight(400)],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                CustomAuthButton(
                  buttonText: "Get Started",
                  buttonColor: AppColors.blueColor,
                  onTap: () {},
                ),
                16.verticalSpace,
                CustomAuthButton(
                  buttonText: "Sign In",
                  buttonColor: AppColors.blueGreyColor,
                  onTap: () {},
                ),
                23.verticalSpace,
                Text(
                  "By continuing, you agree to our Terms & Privacy.",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.inactiveColor,
                    fontVariations: [FontVariation.weight(400)],
                  ),
                ),
                14.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
