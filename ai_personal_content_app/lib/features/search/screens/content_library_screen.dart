import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum _LayoutType { GRID, LIST }

class ContentLibraryScreen extends StatefulWidget {
  const ContentLibraryScreen({super.key});

  @override
  State<ContentLibraryScreen> createState() => _ContentLibraryScreenState();
}

class _ContentLibraryScreenState extends State<ContentLibraryScreen> {
  late final ValueNotifier<_LayoutType> _layoutTypeNotifier;

  @override
  void initState() {
    _layoutTypeNotifier = ValueNotifier(_LayoutType.GRID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Library",
        actions: [Icon(Icons.search_outlined, color: Colors.white)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              spacing: 8.w,
              children: [
                _filterAndSortButton(
                  child: Row(
                    spacing: 8.w,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: AppColors.offWhiteColor,
                        size: 22.w,
                      ),
                      Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.offWhiteColor,
                          fontVariations: [FontVariation.weight(600)],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                _filterAndSortButton(
                  child: Icon(
                    Icons.import_export_outlined,
                    color: AppColors.offWhiteColor,
                    size: 22.w,
                  ),
                  onTap: () {},
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: AppColors.metalColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: _itemLayoutTypeButton(
                            buttonText: "Grid",
                            layoutType: _LayoutType.GRID,
                            onTap: () {
                              _layoutTypeNotifier.value = _LayoutType.GRID;
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: _itemLayoutTypeButton(
                            buttonText: "List",
                            layoutType: _LayoutType.LIST,
                            onTap: () {
                              _layoutTypeNotifier.value = _LayoutType.LIST;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            24.verticalSpace,
            ValueListenableBuilder(
              valueListenable: _layoutTypeNotifier,
              builder: (context, layoutType, child) {
                return Expanded(
                  child: IndexedStack(
                    index: layoutType.index,
                    children: [_GridItemsLayout(), _ListItemsLayout()],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterAndSortButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.metalColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: child,
    );
  }

  Widget _itemLayoutTypeButton({
    required String buttonText,
    required VoidCallback onTap,
    required _LayoutType layoutType,
  }) {
    return ValueListenableBuilder(
      valueListenable: _layoutTypeNotifier,
      builder: (context, isGridLayout, child) {
        return ValueListenableBuilder(
          valueListenable: _layoutTypeNotifier,
          builder: (context, layoutTypeValue, child) {
            return ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: layoutTypeValue == layoutType
                    ? AppColors.darkMetalColor
                    : AppColors.metalColor,
                splashFactory: NoSplash.splashFactory,
                minimumSize: Size(double.infinity, 32.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.offWhiteColor,
                  fontVariations: [FontVariation.weight(600)],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _GridItemsLayout extends StatelessWidget {
  const _GridItemsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14.w,
        mainAxisSpacing: 14.h,
        childAspectRatio: 0.75,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 170.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: NetworkImage(RANDOM_IMAGE_URL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Quantum Computing IntroIntroIntroIntroIntroIntro.pdf",
            style: TextStyle(
              fontSize: 16.sp,
              fontVariations: [FontVariation.weight(600)],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "PDF",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.lightGreyColor,
              fontVariations: [FontVariation.weight(400)],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListItemsLayout extends StatelessWidget {
  const _ListItemsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.network(
            RANDOM_IMAGE_URL,
            fit: BoxFit.cover,
            height: 48.w,
            width: 48.w,
          ),
        ),
        title: Text(
          "Quantum Computing IntroIntroIntro.pdf",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontVariations: [FontVariation.weight(600)],
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          "PDF \u2022 2 hours ago",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.lightGreyColor,
            fontVariations: [FontVariation.weight(500)],
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: Icon(Icons.more_vert_outlined, color: AppColors.lightGreyColor),
        ),
      ),
    );
  }
}
