import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_bloc.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_events.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_states.dart';
import 'package:ai_personal_content_app/features/auth/models/user_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
            return Column(
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
                40.verticalSpace,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12.w,
                  children: [
                    _ProfileCustomButton(
                      title: "Edit Profile",
                      icon: Icons.account_circle_outlined,
                      onTap: () {},
                    ),
                    _ProfileCustomButton(
                      title: "Change Password",
                      icon: Icons.lock_outline_rounded,
                      onTap: () {},
                    ),
                    _ProfileCustomButton(
                      title: "Settings",
                      icon: Icons.settings_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
                40.verticalSpace,
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.blueGreyColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12.h,
                    children: [
                      Text(
                        "Account Summary",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontVariations: [FontVariation.weight(700)],
                        ),
                      ),
                      4.verticalSpace,
                      _accountDetailWidget(
                        "Member since",
                        DateFormat("MMMM d, y").format(userData.creationTime),
                      ),
                      _accountDetailWidget("App Version", "1.0.0"),
                    ],
                  ),
                ),
                Spacer(),
                _ProfileCustomButton(
                  title: "Logout",
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
                  isLogoutButton: true,
                ),
                12.verticalSpace,
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    overlayColor: AppColors.deepRedColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    minimumSize: Size(double.infinity, 56.h),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12.w,
                    children: [
                      Icon(
                        Icons.delete_forever_outlined,
                        color: AppColors.deepRedColor,
                        size: 22.w,
                      ),
                      Text(
                        "Delete Account",
                        style: TextStyle(
                          color: AppColors.deepRedColor,
                          fontSize: 16.sp,
                          fontVariations: [FontVariation.weight(700)],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _accountDetailWidget(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: TextStyle(
            fontSize: 14.sp,
            fontVariations: [FontVariation.weight(400)],
            color: AppColors.inactiveColor,
          ),
        ),
        Text(
          value,
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

class _ProfileCustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isLogoutButton;

  const _ProfileCustomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isLogoutButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueGreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        minimumSize: Size(double.infinity, 56.h),
      ),
      child: !isLogoutButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16.w,
                  children: [
                    Icon(icon, color: AppColors.inactiveColor, size: 24.w),
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
                  color: AppColors.inactiveColor,
                  size: 12.w,
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 12.w,
              children: [
                Icon(icon, color: Colors.white, size: 24.w),
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
    );
  }
}
