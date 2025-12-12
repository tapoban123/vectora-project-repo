import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: commonSystemUiOverlayStyle,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontVariations: [FontVariation.weight(600)],
            ),
          ),
          centerTitle: true,
          leading: Icon(Icons.person, color: Colors.white),
          actionsPadding: EdgeInsets.all(12.w),
          actions: [Icon(Icons.local_library, color: Colors.white)],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.blueColor,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white, size: 28.w),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            18.verticalSpace,
            Container(
              height: 48.w,
              padding: EdgeInsets.all(12.w),
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.blueGreyColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                spacing: 8.w,
                children: [
                  Icon(Icons.search_rounded, color: AppColors.inactiveColor),
                  Text(
                    "Search images, docs and notes...",
                    style: TextStyle(
                      color: AppColors.inactiveColor,
                      fontSize: 16.sp,
                      fontVariations: [FontVariation.weight(400)],
                    ),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 10.w,
                children: [
                  Text(
                    "Pinned",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontVariations: [FontVariation.weight(700)],
                    ),
                  ),
                  SizedBox(
                    height: 88.h,
                    child: ListView.separated(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => _PinnedItemCard(),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 12.w),
                    ),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Text(
                    "Recent",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontVariations: [FontVariation.weight(700)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PinnedItemCard extends StatelessWidget {
  const _PinnedItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.blueGreyColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10.w,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.redColor.withValues(alpha: 0.2),
                ),
                child: Icon(
                  Icons.picture_as_pdf_outlined,
                  color: AppColors.redColor,
                ),
              ),
              Text(
                "PDF",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontVariations: [FontVariation.weight(500)],
                  color: AppColors.inactiveColor,
                ),
              ),
            ],
          ),
          Text(
            "Marketing Strategy 2025.pdf",
            style: TextStyle(
              fontSize: 16.sp,
              fontVariations: [FontVariation.weight(600)],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
