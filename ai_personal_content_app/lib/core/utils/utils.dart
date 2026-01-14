import 'dart:io';

import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

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

String bytesToMegabytes(int bytes) {
  return (bytes / 1_000_000).toStringAsFixed(2);
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

enum DialogType { INFO, ERROR }

void showAppDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? buttonText,
  VoidCallback? onConfirmTap,
  DialogType dialogType = DialogType.INFO,
}) {
  Color color;
  IconData icon;

  switch (dialogType) {
    case DialogType.ERROR:
      color = AppColors.deepRedColor;
      icon = Icons.error;
      break;
    default:
      color = AppColors.blueColor;
      icon = Icons.info;
      break;
  }
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.blueGreyColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12.h,
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.1),
              radius: 30.r,
              child: Icon(icon, color: color, size: 28),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontVariations: [FontVariation.weight(700)],
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: getScreenWidth(context) * 0.62,
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontVariations: [FontVariation.weight(500)],
                  color: AppColors.inactiveColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            8.verticalSpace,
            ElevatedButton(
              onPressed:
                  onConfirmTap ??
                  () {
                    context.pop();
                  },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                backgroundColor: AppColors.blueColor,
                minimumSize: Size(double.infinity, 50.h),
              ),
              child: Text(
                buttonText ?? "Close",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontVariations: [FontVariation.weight(600)],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class ViewPhotoScreen extends StatelessWidget {
  final String name;
  final String path;

  const ViewPhotoScreen({super.key, required this.path, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PhotoView(imageProvider: FileImage(File(path))),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.close),
              ),
            ),
            Positioned(
              top: kMaterialListPadding.top,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontVariations: [FontVariation.weight(500)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
