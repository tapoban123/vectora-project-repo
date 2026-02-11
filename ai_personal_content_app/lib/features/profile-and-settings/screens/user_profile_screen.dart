import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/core/theme/app_svgs.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_bloc.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_events.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_states.dart';
import 'package:ai_personal_content_app/features/auth/models/user_profile_details.dart';
import 'package:ai_personal_content_app/main.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocBuilder<UserAuthBloc, UserAuthStates>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            final UserProfileDetails userData = state.maybeWhen(
              orElse: () => null,
              authenticated: (user) => user,
            )!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  32.verticalSpace,
                  Container(
                    height: 96.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(userData.profilePicture),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    userData.name,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontVariations: [FontVariation.weight(700)],
                    ),
                  ),
                  Text(
                    userData.email,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.inactiveColor,
                      fontVariations: [FontVariation.weight(400)],
                    ),
                  ),
                  42.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: AppColors.blueDarkColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 6.w,
                              children: [
                                Text(
                                  "64 credits",
                                  style: TextStyle(
                                    fontVariations: [FontVariation.weight(600)],
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "remaining",
                                  style: TextStyle(
                                    fontVariations: [FontVariation.weight(500)],
                                    fontSize: 14.sp,
                                    color: AppColors.inactiveColor,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.push(RouteNames.subscriptionPlans);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.blueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                minimumSize: Size(115.w, 36.h),
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                splashFactory: InkSplash.splashFactory,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 8.w,
                                children: [
                                  Icon(
                                    Icons.workspace_premium,
                                    color: Colors.white,
                                    size: 18.w,
                                  ),
                                  Text(
                                    "Upgrade",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontVariations: [
                                        FontVariation.weight(600),
                                      ],
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        14.verticalSpace,
                        Divider(color: AppColors.borderColor),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: APP_FONT_FAMILY,
                                  fontVariations: [FontVariation.weight(500)],
                                  color: AppColors.inactiveColor.withValues(
                                    alpha: 0.8,
                                  ),
                                  height: 2,
                                  fontSize: 12.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: "2",
                                    style: TextStyle(
                                      color: AppColors.inactiveColor,
                                      fontVariations: [
                                        FontVariation.weight(600),
                                      ],
                                    ),
                                  ),
                                  TextSpan(text: " per upload "),
                                  TextSpan(
                                    text: "\u2022 0.5",
                                    style: TextStyle(
                                      color: AppColors.inactiveColor,
                                      fontVariations: [
                                        FontVariation.weight(600),
                                      ],
                                    ),
                                  ),
                                  TextSpan(text: " per search "),
                                  TextSpan(
                                    text: "\u2022 Unlimited chat",
                                    style: TextStyle(
                                      color: AppColors.inactiveColor,
                                      fontVariations: [
                                        FontVariation.weight(600),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  30.verticalSpace,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12.w,
                    children: [
                      _ProfileCustomButton(
                        title: "Settings",
                        icon: Icons.settings_outlined,
                        onTap: () {},
                      ),
                      _ProfileCustomButton(
                        title: "Billing History",
                        icon: Icons.history_outlined,
                        onTap: () {},
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ABOUT",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontVariations: [FontVariation.weight(600)],
                            color: AppColors.lightBlueGreyColor,
                          ),
                        ),
                        12.verticalSpace,
                        _aboutInfoListTile(
                          text: "View source code",
                          onTap: () async {
                            final url = Uri.parse(PROJECT_GITHUB_URL);
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12.r),
                            bottom: Radius.zero,
                          ),
                          icon: githubLogoSvg(),
                          trailingIcon: Icon(
                            Icons.open_in_new_outlined,
                            size: 18.w,
                            color: AppColors.inactiveColor.withValues(
                              alpha: 0.5,
                            ),
                          ),
                        ),
                        _aboutInfoListTile(
                          text: "Privacy Policy",
                          onTap: () {},
                        ),
                        _aboutInfoListTile(
                          text: "Terms of service",
                          onTap: () {},
                        ),
                        _aboutInfoListTile(
                          text: "App version",
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12.r),
                            top: Radius.zero,
                          ),
                          trailingIcon: Text(
                            "${packageInfo.version} (${packageInfo.buildNumber})",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontVariations: [FontVariation.weight(500)],
                              color: AppColors.lightGreyColor.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  40.verticalSpace,
                  _DeleteOrLogoutButton(
                    text: "Logout",
                    icon: Icons.logout,
                    onTap: () {
                      showAppDialog(
                        context,
                        title: "Logout",
                        message: "Are you sure you want to logout?",
                        buttonText: "Continue",
                        dialogIcon: Icons.logout_rounded,
                        onConfirmTap: () {
                          context.read<UserAuthBloc>().add(SignOut());
                        },
                      );
                    },
                  ),
                  12.verticalSpace,
                  _DeleteOrLogoutButton(
                    text: "Delete Account",
                    icon: Icons.delete_forever_outlined,
                    onTap: () {},
                  ),
                  14.verticalSpace,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _aboutInfoListTile({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
    Widget? trailingIcon,
    BorderRadius? borderRadius,
  }) {
    return ListTile(
      leading: icon,
      tileColor: AppColors.blueDarkColor,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.zero,
      ),
      title: Text(
        text,
        style: TextStyle(fontVariations: [FontVariation.weight(600)]),
      ),
      trailing:
          trailingIcon ??
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.inactiveColor.withValues(alpha: 0.6),
            size: 14.w,
          ),
    );
  }
}

class _ProfileCustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _ProfileCustomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueDarkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        minimumSize: Size(double.infinity, 68.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16.w,
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: AppColors.blueGreyColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: AppColors.inactiveColor, size: 24.w),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontVariations: [FontVariation.weight(600)],
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.inactiveColor.withValues(alpha: 0.6),
            size: 14.w,
          ),
        ],
      ),
    );
  }
}

class _DeleteOrLogoutButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _DeleteOrLogoutButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        overlayColor: AppColors.deepRedColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
        minimumSize: Size(double.infinity, 56.h),
        backgroundColor: AppColors.blueDarkColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.w,
        children: [
          Icon(icon, color: AppColors.deepRedColor, size: 22.w),
          Text(
            text,
            style: TextStyle(
              color: AppColors.deepRedColor,
              fontSize: 16.sp,
              fontVariations: [FontVariation.weight(700)],
            ),
          ),
        ],
      ),
    );
  }
}
