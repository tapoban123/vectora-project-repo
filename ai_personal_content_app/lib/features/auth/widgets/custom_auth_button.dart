import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onTap;

  const CustomAuthButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 56.w),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12.r),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: APP_FONT_FAMILY,
          color: Colors.white,
          fontVariations: [FontVariation.weight(650)],
        ),
      ),
    );
  }
}
