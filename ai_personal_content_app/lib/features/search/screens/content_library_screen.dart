import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_button.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum _LayoutType { GRID, LIST }

class ContentLibraryScreen extends StatefulWidget {
  const ContentLibraryScreen({super.key});

  @override
  State<ContentLibraryScreen> createState() => _ContentLibraryScreenState();
}

class _ContentLibraryScreenState extends State<ContentLibraryScreen> {
  late final ValueNotifier<_LayoutType> _layoutTypeNotifier;
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  final _sortOptions = [
    (title: "Recently Added", status: true),
    (title: "Oldest First", status: false),
    (title: "Recently Updated", status: false),
    (title: "Name (A-Z)", status: false),
    (title: "Name (Z-A)", status: false),
    (title: "File Size (Largest First)", status: false),
    (title: "File Size (Smallest First)", status: false),
  ];

  final _filterByFileTypeOptions = [
    (fileType: "PDF", status: true),
    (fileType: "Image", status: false),
    (fileType: "Text", status: true),
    (fileType: "Note", status: false),
  ];

  final _filterByTimeOptions = [
    (time: "Today", status: true),
    (time: "Last 7 days", status: false),
    (time: "Last 30 days", status: false),
  ];

  @override
  void initState() {
    _scaffoldKey = GlobalKey();
    _layoutTypeNotifier = ValueNotifier(_LayoutType.GRID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  onTap: () {
                    _showFilterOptionsSheet(context);
                  },
                ),
                _filterAndSortButton(
                  child: Icon(
                    Icons.import_export_outlined,
                    color: AppColors.offWhiteColor,
                    size: 22.w,
                  ),
                  onTap: () {
                    _showSortOptionsSheet(context);
                  },
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
                              if (_layoutTypeNotifier.value !=
                                  _LayoutType.GRID) {
                                _layoutTypeNotifier.value = _LayoutType.GRID;
                              }
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: _itemLayoutTypeButton(
                            buttonText: "List",
                            layoutType: _LayoutType.LIST,
                            onTap: () {
                              if (_layoutTypeNotifier.value !=
                                  _LayoutType.LIST) {
                                _layoutTypeNotifier.value = _LayoutType.LIST;
                              }
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

  void _showSortOptionsSheet(BuildContext context) {
    _scaffoldKey.currentState?.showBottomSheet(
      (context) => TapRegion(
        onTapOutside: (event) {
          context.pop();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.deepBlueColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerRow("Sort Options", "SORT BY"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(
                        _sortOptions.length,
                        (index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          minTileHeight: 50.h,
                          onTap: () {},
                          title: Text(
                            _sortOptions[index].title,
                            style: TextStyle(
                              color: AppColors.offWhiteColor,
                              fontVariations: [FontVariation.weight(500)],
                            ),
                          ),
                          trailing: Container(
                            height: 17.w,
                            width: 17.w,
                            padding: EdgeInsets.all(3.5.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _sortOptions[index].status
                                    ? AppColors.blueColor
                                    : AppColors.lightBlueGreyColor,
                              ),
                            ),
                            child: _sortOptions[index].status
                                ? Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.blueColor,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    CustomAppButton(
                      buttonText: "Apply",
                      minimumSize: Size(double.infinity, 54.h),
                      fontSize: 15.sp,
                      onTap: () {},
                    ),
                    10.verticalSpace,
                    _clearSortOrFilterButton("Clear Sort", () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterOptionsSheet(BuildContext context) {
    _scaffoldKey.currentState?.showBottomSheet(
      (context) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.deepBlueColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: TapRegion(
          onTapOutside: (event) {
            context.pop();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerRow("Filter Options", "FILTER"),
              // 12.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "File Type",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.offWhiteColor,
                        fontVariations: [FontVariation.weight(600)],
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      children: List.generate(
                        _filterByFileTypeOptions.length,
                        (index) => Card(
                          color: _filterByFileTypeOptions[index].status
                              ? AppColors.blueColor
                              : AppColors.deepBlueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            side: !_filterByFileTypeOptions[index].status
                                ? BorderSide(color: Colors.white10, width: 1.5)
                                : BorderSide.none,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 8.w,
                            ),
                            child: Text(
                              _filterByFileTypeOptions[index].fileType,
                              style: TextStyle(
                                color: _filterByFileTypeOptions[index].status
                                    ? Colors.white
                                    : AppColors.lightGreyColor,
                                fontSize: 15.sp,
                                fontVariations: [FontVariation.weight(600)],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Pinned only",
                        style: TextStyle(
                          fontVariations: [FontVariation.weight(500)],
                        ),
                      ),
                      trailing: CupertinoSwitch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      "Time",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.offWhiteColor,
                        fontVariations: [FontVariation.weight(600)],
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      children: List.generate(
                        _filterByTimeOptions.length,
                        (index) => Card(
                          color: _filterByTimeOptions[index].status
                              ? AppColors.blueColor
                              : AppColors.deepBlueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            side: !_filterByTimeOptions[index].status
                                ? BorderSide(color: Colors.white10, width: 1.5)
                                : BorderSide.none,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 8.w,
                            ),
                            child: Text(
                              _filterByTimeOptions[index].time,
                              style: TextStyle(
                                color: _filterByTimeOptions[index].status
                                    ? Colors.white
                                    : AppColors.lightGreyColor,
                                fontSize: 15.sp,
                                fontVariations: [FontVariation.weight(600)],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    40.verticalSpace,
                    CustomAppButton(
                      buttonText: "Apply",
                      fontSize: 15.sp,
                      minimumSize: Size(double.infinity, 50.h),
                      onTap: () {},
                    ),
                    8.verticalSpace,
                    _clearSortOrFilterButton("Clear Filters", () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerRow(String text, String subHeaderText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        14.verticalSpace,
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 5.h,
            width: 50.w,
            decoration: BoxDecoration(color: AppColors.lightBlueGreyColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontVariations: [FontVariation.weight(800)],
                ),
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                  padding: EdgeInsets.all(5.w),
                  minimumSize: Size.zero,
                ),
                icon: Icon(
                  Icons.close,
                  color: AppColors.lightGreyColor,
                  size: 20.w,
                ),
              ),
            ],
          ),
        ),
        Divider(color: AppColors.borderColor),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            subHeaderText,
            style: TextStyle(
              fontSize: 12.sp,
              fontVariations: [FontVariation.weight(900)],
              color: AppColors.lightGreyColor.withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    );
  }

  TextButton _clearSortOrFilterButton(String buttonText, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        overlayColor: AppColors.inactiveColor,
        minimumSize: Size(double.infinity, 48.h),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.lightGreyColor,
          fontVariations: [FontVariation.weight(600)],
        ),
      ),
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
        childAspectRatio: 0.714,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.push(RouteNames.viewItemOptions);
        },
        child: Column(
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
            12.verticalSpace,
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
        onTap: () {
          context.push(RouteNames.viewItemOptions);
        },
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
