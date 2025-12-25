import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

enum _SearchContentFilters { ALL, IMAGES, DOCUMENTS, NOTES }

class SearchContentsScreen extends StatefulWidget {
  const SearchContentsScreen({super.key});

  @override
  State<SearchContentsScreen> createState() => _SearchContentsScreenState();
}

class _SearchContentsScreenState extends State<SearchContentsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isSearchQueryEmpty = ValueNotifier(true);
  final ValueNotifier<_SearchContentFilters> _selectedFilter = ValueNotifier(
    _SearchContentFilters.ALL,
  );
  final List _documents = List.generate(8, (index) => index);
  final List _images = List.generate(7, (index) => index);
  final List _notes = List.generate(8, (index) => index);

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _selectedFilter.dispose();
    _isSearchQueryEmpty.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contentFilters = [
      (name: "All Results", count: ""),
      (name: "Images", count: "12"),
      (name: "Documents", count: "8"),
      (name: "Notes", count: "5"),
    ];

    return Scaffold(
      appBar: CustomAppbar(title: "Search"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
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
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: SizedBox(
                    height: 30.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 8.w,),
                      scrollDirection: Axis.horizontal,
                      itemCount: contentFilters.length,
                      itemBuilder: (context, index) => ValueListenableBuilder(
                        valueListenable: _selectedFilter,
                        builder: (context, selectedFilterIndex, child) {
                          final isSelected =
                              selectedFilterIndex ==
                              _SearchContentFilters.values[index];
                          return GestureDetector(
                            onTap: () {
                              _selectedFilter.value =
                                  _SearchContentFilters.values[index];
                            },
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.blueColor
                                    : AppColors.metalColor,
                                borderRadius: BorderRadius.circular(50.r),
                                border: isSelected
                                    ? Border.all(
                                        width: 1,
                                        color: AppColors.inactiveColor
                                            .withValues(alpha: 0.2),
                                      )
                                    : null,
                              ),
                              child: Text(
                                "${contentFilters[index].name} ${contentFilters[index].count.isNotEmpty ? "(${contentFilters[index].count})" : ""}",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontVariations: [FontVariation.weight(750)],
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.lightGreyColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.borderColor),
          14.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ValueListenableBuilder(
                valueListenable: _selectedFilter,
                builder: (context, selectedFilter, child) {
                  return CustomScrollView(
                    slivers: [
                      if ([
                        _SearchContentFilters.IMAGES,
                        _SearchContentFilters.ALL,
                      ].contains(selectedFilter))
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 14.w),
                            child: _sectionHeadingText("IMAGES (12)"),
                          ),
                        ),
                      if (_images.isNotEmpty &&
                          selectedFilter == _SearchContentFilters.ALL)
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 120.h,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 12.w),
                              scrollDirection: Axis.horizontal,
                              itemCount: _images.length,
                              itemBuilder: (context, index) =>
                                  _ImageCardWidget(),
                            ),
                          ),
                        ),
                      if (_images.isNotEmpty &&
                          selectedFilter == _SearchContentFilters.IMAGES)
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                mainAxisSpacing: 10.w,
                                crossAxisSpacing: 12.h,
                              ),
                          delegate: SliverChildBuilderDelegate(
                            childCount: _images.length,
                            (context, index) =>
                                _ImageCardWidget(isGridLayout: true),
                          ),
                        ),
                      if ([
                        _SearchContentFilters.DOCUMENTS,
                        _SearchContentFilters.ALL,
                      ].contains(selectedFilter))
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: selectedFilter == _SearchContentFilters.ALL
                                  ? 30.h
                                  : 0,
                              bottom: 12.h,
                            ),
                            child: _sectionHeadingText("DOCUMENTS (8)"),
                          ),
                        ),
                      if (_documents.isNotEmpty &&
                          [
                            _SearchContentFilters.DOCUMENTS,
                            _SearchContentFilters.ALL,
                          ].contains(selectedFilter))
                        SliverList.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          itemCount: _documents.length,
                          itemBuilder: (context, index) => _DocumentCardWidget(
                            fileType: ContentFileType.PDF,
                          ),
                        ),
                      if ([
                        _SearchContentFilters.NOTES,
                        _SearchContentFilters.ALL,
                      ].contains(selectedFilter))
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: selectedFilter == _SearchContentFilters.ALL
                                  ? 30.h
                                  : 0,
                              bottom: 12.h,
                            ),
                            child: _sectionHeadingText("NOTES (5)"),
                          ),
                        ),
                      if (_notes.isNotEmpty &&
                          [
                            _SearchContentFilters.NOTES,
                            _SearchContentFilters.ALL,
                          ].contains(selectedFilter))
                        SliverList.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          itemCount: _notes.length,
                          itemBuilder: (context, index) => _DocumentCardWidget(
                            fileType: ContentFileType.NOTE,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
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

class _ImageCardWidget extends StatelessWidget {
  final bool isGridLayout;

  const _ImageCardWidget({super.key, this.isGridLayout = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onTap: () {
            context.push(RouteNames.viewItemOptions);
          },
          child: Container(
            width: isGridLayout ? null : 160.w,
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
              width: isGridLayout ? null : 160.w,
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
    );
  }
}

class _DocumentCardWidget extends StatelessWidget {
  final ContentFileType fileType;

  const _DocumentCardWidget({super.key, required this.fileType});

  Color _getMatchPercentColor(int percent) {
    if (percent >= 90) {
      return Color(0xFF2ED573);
    } else if (percent >= 80 && percent < 90) {
      return Color(0xFF3D6DFF);
    } else if (percent >= 70 && percent < 80) {
      return Color(0xFF8B7CFF);
    } else if (percent >= 60 && percent < 70) {
      return Color(0xFFF4A261);
    } else {
      return Color(0xFF9AA4BF);
    }
  }

  @override
  Widget build(BuildContext context) {
    final matchPercent = 97;
    final percentColor = _getMatchPercentColor(matchPercent);
    final isPdf = fileType == ContentFileType.PDF;

    return Container(
      width: double.infinity,
      height: 105.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.greyColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.w,
        children: [
          Container(
            padding: EdgeInsetsGeometry.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.lightBlueGreyColor.withValues(alpha: 0.5),
            ),
            child: Icon(
              isPdf ? Icons.picture_as_pdf_rounded : Icons.edit_note_outlined,
              color: isPdf ? AppColors.blueColor : AppColors.violetColor,
              size: 24.w,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: getScreenWidth(context) * 0.55,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontVariations: [FontVariation.weight(800)],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Card(
                      color: percentColor.withValues(alpha: 0.12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.w,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 4.w,
                          children: [
                            Icon(Icons.bolt, size: 12.w, color: percentColor),
                            Text(
                              "$matchPercent%",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: percentColor,
                                fontVariations: [FontVariation.weight(700)],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: getScreenWidth(context) * 0.7,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas at ipsum in nunc",
                    style: TextStyle(
                      color: AppColors.inactiveColor,
                      fontSize: 14.sp,
                      fontVariations: [FontVariation.weight(550)],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                8.verticalSpace,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 14.w,
                  children: [
                    _fileMetadataWidget(
                      Icons.calendar_today_sharp,
                      DateFormat("MMM d").format(DateTime.now()),
                    ),
                    _fileMetadataWidget(
                      Icons.access_time_filled_rounded,
                      DateFormat("h:mm a").format(DateTime.now()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fileMetadataWidget(IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6.w,
      children: [
        Icon(
          icon,
          size: 12.w,
          color: AppColors.inactiveColor.withValues(alpha: 0.6),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColors.inactiveColor.withValues(alpha: 0.6),
            fontSize: 12.sp,
            fontVariations: [FontVariation.weight(600)],
          ),
        ),
      ],
    );
  }
}
