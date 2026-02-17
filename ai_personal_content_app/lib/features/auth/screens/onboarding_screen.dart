import 'dart:developer';

import 'package:ai_personal_content_app/core/theme/app_assets.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/core/theme/app_svgs.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_bloc.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_events.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_states.dart';
import 'package:ai_personal_content_app/features/auth/widgets/custom_auth_button.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late bool _isAnimationLoading;

  @override
  void initState() {
    _isAnimationLoading = true;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: commonSystemUiOverlayStyle,
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
                          color: AppColors.metalColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.w),
                          child: appIconSvg(),
                        ),
                      ),
                      30.verticalSpace,
                      Text(
                        "Where your content connects.",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontVariations: [FontVariation.weight(500)],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      70.verticalSpace,
                      AnimatedOpacity(
                        opacity: _isAnimationLoading ? 0.0 : 0.9,
                        duration: Duration(milliseconds: 500),
                        child: Lottie.asset(
                          AppAssets.networkLottie,
                          controller: _controller,
                          height: 350.h,
                          onLoaded: (_) {
                            setState(() {
                              _isAnimationLoading = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserAuthBloc>().add(SignIn());
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 56.w),
                        backgroundColor: Colors.white,
                        splashFactory: NoSplash.splashFactory,
                        overlayColor: AppColors.metalColor.withValues(
                          alpha: 0.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12.r),
                        ),
                      ),
                      child: BlocConsumer<UserAuthBloc, UserAuthStates>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () => null,
                            authenticated: (user) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (context.mounted) {
                                  context.go(RouteNames.home);
                                }
                              });
                            },
                            error: (exception) =>
                                showToastMessage(exception.message),
                          );
                        },
                        builder: (context, state) => state.maybeWhen(
                          orElse: () => Row(
                            spacing: 12.w,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              googleLogoSvg(),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: APP_FONT_FAMILY,
                                  color: Colors.black,
                                  fontVariations: [FontVariation.weight(650)],
                                ),
                              ),
                            ],
                          ),
                          loading: () => appCircularProgressIndicator(),
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    RichText(
                      text: TextSpan(
                        text: "BY CONTINUING, YOU AGREE TO OUR ",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.inactiveColor,
                          fontFamily: APP_FONT_FAMILY,
                          fontVariations: [FontVariation.weight(400)],
                          letterSpacing: 0.8,
                        ),
                        children: [
                          TextSpan(
                            text: "TERMS",
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.inactiveColor,
                            ),
                          ),
                          TextSpan(text: " & "),
                          TextSpan(
                            text: "PRIVACY",
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.inactiveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                18.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackupOnboardingScreen extends StatelessWidget {
  const _BackupOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
