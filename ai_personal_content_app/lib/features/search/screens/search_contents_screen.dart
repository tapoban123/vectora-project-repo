import 'dart:developer';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchContentsScreen extends StatefulWidget {
  const SearchContentsScreen({super.key});

  @override
  State<SearchContentsScreen> createState() => _SearchContentsScreenState();
}

class _SearchContentsScreenState extends State<SearchContentsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isSearchQueryEmpty = ValueNotifier(true);

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Search"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              focusNode: _focusNode,
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.blueGreyColor,
                hintText: "Search images, docs and notes...",
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: AppColors.inactiveColor,
                ),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: _isSearchQueryEmpty,
                  builder: (context, isEmpty, child) {
                    if (isEmpty) {
                      return SizedBox.shrink();
                    }
                    return GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        _isSearchQueryEmpty.value = true;
                      },
                      child: Icon(
                        Icons.cancel_outlined,
                        color: AppColors.inactiveColor,
                      ),
                    );
                  },
                ),
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.inactiveColor,
                  fontVariations: [FontVariation.weight(600)],
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              style: TextStyle(
                fontSize: 16.sp,
                fontVariations: [FontVariation.weight(500)],
              ),
              cursorColor: Colors.white,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _isSearchQueryEmpty.value = false;
                } else if (value.isEmpty) {
                  _isSearchQueryEmpty.value = true;
                }
              },
              onTapOutside: (event) {
                _focusNode.unfocus();
              },
            ),
            30.verticalSpace,
            _sectionHeadingText("IMAGES (12)"),
            12.verticalSpace,
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(RouteNames.viewItemOptions);
                        },
                        child: Container(
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            image: DecorationImage(
                              image: NetworkImage(RANDOM_IMAGE_URL),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 50.h,
                        child: IgnorePointer(
                          child: Container(
                            height: 50.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black, Colors.transparent],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12.h,
                        left: 12.w,
                        child: IgnorePointer(
                          child: Text(
                            "AI Brainstorming",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontVariations: [FontVariation.weight(600)],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            30.verticalSpace,
            _sectionHeadingText("DOCUMENTS (8)"),
          ],
        ),
      ),
    );
  }

  Text _sectionHeadingText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.inactiveColor,
        letterSpacing: 0.8,
        fontVariations: [FontVariation.weight(800)],
      ),
    );
  }
}
