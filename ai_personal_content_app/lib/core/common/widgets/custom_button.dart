import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppButton extends StatelessWidget {
  final String buttonText;
  final double? height;
  final VoidCallback onTap;

  const CustomAppButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueColor,
        fixedSize: Size(getScreenWidth(context) * 0.85, height ?? 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
          fontVariations: [FontVariation.weight(700)],
        ),
      ),
    );
  }
}
