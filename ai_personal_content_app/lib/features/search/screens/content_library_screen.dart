import 'dart:convert';
import 'dart:io';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_button.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_bloc.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_events.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_states.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
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
    context.read<ContentsManagerBloc>().add(FetchAllContents());
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
                  child:
                      BlocBuilder<ContentsManagerBloc, ContentsManagerStates>(
                        builder: (context, state) {
                          final List<ContentsEntity> contents = state.maybeWhen(
                            orElse: () => [],
                            allContents: (contents) => contents,
                          );

                          if (contents.isEmpty) {
                            return Center(
                              child: Text(
                                "You do not have any contents to display.",
                                style: TextStyle(
                                  fontVariations: [FontVariation.weight(600)],
                                  fontSize: 16.sp,
                                ),
                              ),
                            );
                          }

                          return IndexedStack(
                            index: layoutType.index,
                            children: [
                              _GridItemsLayout(contents: contents),
                              _ListItemsLayout(contents: contents),
                            ],
                          );
                        },
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
  final List<ContentsEntity> contents;

  const _GridItemsLayout({super.key, required this.contents});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14.w,
        mainAxisSpacing: 14.h,
        childAspectRatio: 0.714,
      ),
      itemCount: contents.length,
      itemBuilder: (context, index) {
        final content = contents[index];
        final bool isContentImage = content.type == ContentFileType.IMAGE.name;
        final bool isContentNote = content.type == ContentFileType.NOTE.name;
        final bool isContentPdf = content.type == ContentFileType.PDF.name;

        Widget? iconWidget;

        if (isContentNote) {
          final json = File(content.path).readAsStringSync();
          final String noteText = Document.fromJson(jsonDecode(json)).toPlainText();
          iconWidget = Text(noteText, style: TextStyle(
              fontSize: 12.sp,
              fontVariations: [FontVariation.weight(500)]),
          overflow: TextOverflow.ellipsis,
          maxLines: 10,);
        }
        return GestureDetector(
          onTap: () {
            context.push(
              RouteNames.viewItemOptions,
              extra: {"content": content},
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 170.h,
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.metalColor,
                  image:isContentImage? DecorationImage(
                    image:  FileImage(File(content.path)),
                    fit: BoxFit.cover,
                  ):null,
                ),
                child: iconWidget,
              ),
              12.verticalSpace,
              Text(
                content.contentName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontVariations: [FontVariation.weight(600)],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                content.extension.toUpperCase(),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.lightGreyColor,
                  fontVariations: [FontVariation.weight(400)],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ListItemsLayout extends StatelessWidget {
  final List<ContentsEntity> contents;

  const _ListItemsLayout({super.key, required this.contents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contents.length,
      itemBuilder: (context, index) {
        final content = contents[index];
        final bool isContentImage = content.type == ContentFileType.IMAGE.name;
        final bool isContentNote = content.type == ContentFileType.NOTE.name;
        final bool isContentPdf = content.type == ContentFileType.PDF.name;

        late final Widget iconWidget;

        if (isContentImage) {
          iconWidget = ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.file(
              File(content.path),
              height: 48.w,
              width: 48.w,
              fit: BoxFit.cover,
            ),
          );
        } else {
          iconWidget = Container(
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.greyColor,
            ),
            child: Icon(
              isContentNote ? Icons.note_alt : Icons.picture_as_pdf,
              color: AppColors.offWhiteColor,
              size: 24.w,
            ),
          );
        }
        return ListTile(
          onTap: () {
            context.push(
              RouteNames.viewItemOptions,
              extra: {"content": content},
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          leading: iconWidget,
          title: Text(
            content.contentName,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontVariations: [FontVariation.weight(600)],
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            "${content.extension.toUpperCase()} \u2022 2 hours ago",
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
            icon: Icon(
              Icons.more_vert_outlined,
              color: AppColors.lightGreyColor,
            ),
          ),
        );
      },
    );
  }
}
