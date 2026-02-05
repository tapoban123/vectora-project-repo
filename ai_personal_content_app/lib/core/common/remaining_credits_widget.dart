import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RemainingCreditsWidget extends StatelessWidget {
  const RemainingCreditsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // context.push(RouteNames.showAd);
        showCreditsDialog(context);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 5.h),
          minimumSize: Size.zero
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.stars, color: Colors.yellow),
          Text(
            "1200",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontVariations: [FontVariation.weight(500)],
            ),
          ),
        ],
      ),
    );
  }
}
