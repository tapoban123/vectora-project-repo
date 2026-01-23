import 'dart:developer';
import 'dart:io';

import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

final SystemUiOverlayStyle commonSystemUiOverlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: AppColors.backgroundColor,
  statusBarColor: AppColors.backgroundColor,
);

void showSnackBarMessage(
  BuildContext context, {
  required String message,
  String? actionButtonText,
  VoidCallback? onTapActionButton,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.greyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16.r),
        side: BorderSide(color: AppColors.blueColor),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12.w,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: AppColors.blueColor, size: 18.w),
              Text(
                message,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontVariations: [FontVariation.weight(600)],
                ),
              ),
            ],
          ),
          if (actionButtonText != null)
            TextButton(
              onPressed: onTapActionButton,
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.all(0),
                visualDensity: VisualDensity.compact,
                minimumSize: Size(50, 0),
              ),
              child: Text(
                actionButtonText,
                style: TextStyle(
                  fontVariations: [FontVariation.weight(700)],
                  fontSize: 16.sp,
                  color: AppColors.blueColor,
                ),
              ),
            ),
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

void showToastMessage(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.blueGreyColor,
    textColor: Colors.white,
    fontSize: 16.sp,
  );
}

enum DialogType { INFO, ERROR }

void showAppDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? buttonText,
  VoidCallback? onConfirmTap,
  Color? confirmButtonColor,
  bool includeCancelButton = false,
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

  ElevatedButton dialogButton({
    required String text,
    required Color bgColor,
    required VoidCallback onTap,
  }) => ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      backgroundColor: bgColor,
      minimumSize: Size(double.infinity, 50.h),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontVariations: [FontVariation.weight(600)],
      ),
    ),
  );

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
            Row(
              spacing: includeCancelButton ? 10.w : 0,
              children: [
                Flexible(
                  flex: 1,
                  child: dialogButton(
                    text: buttonText ?? "Close",
                    bgColor: confirmButtonColor ?? AppColors.blueColor,
                    onTap:
                        onConfirmTap ??
                        () {
                          context.pop();
                        },
                  ),
                ),
                if (includeCancelButton)
                  Flexible(
                    flex: 1,
                    child: dialogButton(
                      text: "Cancel",
                      bgColor: AppColors.blueColor,
                      onTap: () {
                        context.pop();
                      },
                    ),
                  ),
              ],
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

class PdfViewScreen extends StatelessWidget {
  final String name;
  final String path;

  const PdfViewScreen({super.key, required this.name, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PDFView(
              filePath: path,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
              backgroundColor: Colors.black,
              onLinkHandler: (uri) async {
                log(uri.toString());
                if (uri != null) {
                  final url = Uri.parse(uri);
                  await launchUrl(url, mode: LaunchMode.inAppBrowserView);
                }
              },
              onRender: (_pages) {
                // setState(() {
                //   pages = _pages;
                //   isReady = true;
                // });
              },
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                // _controller.complete(pdfViewController);
              },
              onPageChanged: (page, total) {},
            ),
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
