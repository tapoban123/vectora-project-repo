import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ViewItemScreen extends StatelessWidget {
  const ViewItemScreen({super.key});
  // void _showFoodSearchBottomSheet(BuildContext parentContext) {
  //
  //   _scaffoldKey.currentState?.showBottomSheet(enableDrag: false, (
  //       parentContext,
  //       ) {
  //     final screenHeight = MediaQuery.of(context).size.height;
  //     return ValueListenableBuilder<bool>(
  //       valueListenable: _isBottomSheetOpen,
  //       builder: (context, isOpen, _) {
  //         final targetHeight =
  //             (isOpen ? _maxFraction : _minFraction) * screenHeight;
  //         return AnimatedContainer(
  //           duration: const Duration(milliseconds: 300),
  //           curve: Curves.easeOut,
  //           height: targetHeight,
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //             color: CustomTheme.scaffoldBgColor,
  //             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //           ),
  //           child: _FoodSearchBottomSheet(isSheetOpen: isOpen),
  //         );
  //       },
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final optionsData = [
      (icon: Icons.chat_outlined, color: null, label: "Chat", onTap: () {}),
      (icon: Icons.manage_search, color: null, label: "Search", onTap: () {}),
      (icon: Icons.push_pin_outlined, color: null, label: "Pin", onTap: () {}),
      (
        icon: Icons.cloud_upload_outlined,
        color: null,
        label: "Upload",
        onTap: () {},
      ),
      (
        icon: Icons.delete_outline,
        color: AppColors.deepRedColor,
        label: "Delete",
        onTap: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Project Plan.pdf",
          style: TextStyle(
            color: Colors.white,
            fontVariations: [FontVariation.weight(600)],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kTabLabelPadding.left,
        ).copyWith(top: 15.h),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: getScreenHeight(context) * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/200/300"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  18.verticalSpace,
                  Divider(color: AppColors.borderColor),
                  16.verticalSpace,
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: _itemDetailWidget(
                          label: "Created",
                          value: DateFormat("MMM d, y").format(DateTime.now()),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: _itemDetailWidget(label: "Type", value: "PDF"),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Divider(color: AppColors.borderColor),
                  16.verticalSpace,
                  _itemDetailWidget(label: "Size", value: "2.1 MB"),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      optionsData.length,
                      (index) => _ItemOptionsButton(
                        icon: optionsData[index].icon,
                        label: optionsData[index].label,
                        onTap: optionsData[index].onTap,
                        color: optionsData[index].color,
                      ),
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

  Widget _itemDetailWidget({required String label, required String value}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontVariations: [FontVariation.weight(500)],
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
        ),
      ],
    );
  }
}

class _ItemOptionsButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _ItemOptionsButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.w,
      children: [
        IconButton(
          onPressed: onTap,
          style: IconButton.styleFrom(
            padding: EdgeInsetsGeometry.all(14.w),
            backgroundColor: AppColors.greyColor,
          ),
          icon: Icon(icon, color: color ?? Colors.white, size: 25.w),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontVariations: [FontVariation.weight(600)],
            color: color ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
