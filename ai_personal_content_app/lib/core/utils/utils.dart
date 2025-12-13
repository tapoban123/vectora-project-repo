import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final SystemUiOverlayStyle commonSystemUiOverlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: AppColors.backgroundColor,
  statusBarColor: AppColors.backgroundColor,
);

void showSnackBarMessage(
  BuildContext context, {
  required String message,
  bool showActionButton = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 14.sp,
              fontVariations: [FontVariation.weight(400)],
            ),
          ),
          showActionButton
              ? TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.all(0),
                    visualDensity: VisualDensity.compact,
                    minimumSize: Size(50, 0),
                  ),
                  child: Text(
                    "UNDO",
                    style: TextStyle(
                      fontVariations: [FontVariation.weight(700)],
                      fontSize: 16.sp,
                      color: AppColors.blueColor,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    ),
  );
}
