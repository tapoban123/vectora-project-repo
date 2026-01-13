import 'dart:developer';
import 'dart:io';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_bloc.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_events.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_states.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/features/search/models/contents_with_scrore_model.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  // List _documents = List.generate(8, (index) => index);
  // List _images = List.generate(7, (index) => index);
  // List _notes = List.generate(8, (index) => index);

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

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
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context.read<SearchContentsBloc>().add(
                        GenerateQueryEmbeddings(
                          query: _searchController.text.trim(),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: SizedBox(
                    height: 30.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 8.w),
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
              child: BlocConsumer<SearchContentsBloc, SearchContentsStates>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () => null,
                    error: (message, statusCode) => showAppDialog(
                      context,
                      title: (statusCode ?? "Error").toString(),
                      message: message,
                      dialogType: DialogType.ERROR,
                    ),
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => SizedBox.shrink(),
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.offWhiteColor,
                      ),
                    ),
                    embeddingsGenerated: (contents) => ValueListenableBuilder(
                      valueListenable: _selectedFilter,
                      builder: (context, selectedFilter, child) {
                        log(
                          contents
                              .map((e) => e.content.contentName)
                              .toList()
                              .toString(),
                        );
                        log(contents.map((e) => e.score).toList().toString());
                        final images = contents
                            .where(
                              (element) =>
                                  element.content.type ==
                                  ContentFileType.IMAGE.name,
                            )
                            .toList();
                        final documents = contents
                            .where(
                              (element) =>
                                  element.content.type ==
                                  ContentFileType.PDF.name,
                            )
                            .toList();
                        final notes = contents
                            .where(
                              (element) =>
                                  element.content.type ==
                                  ContentFileType.NOTE.name,
                            )
                            .toList();

                        final bestScore = contents.first.score;
                        final worstScore = contents.last.score;

                        return CustomScrollView(
                          slivers: [
                            if ([
                              _SearchContentFilters.IMAGES,
                              _SearchContentFilters.ALL,
                            ].contains(selectedFilter))
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 14.w),
                                  child: _sectionHeadingText(
                                    "IMAGES (${images.length})",
                                  ),
                                ),
                              ),
                            if (images.isNotEmpty &&
                                selectedFilter == _SearchContentFilters.ALL)
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 120.h,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 12.w),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    itemBuilder: (context, index) =>
                                        _ImageCardWidget(
                                          contentWithScores: images[index],
                                        ),
                                  ),
                                ),
                              ),
                            if (images.isNotEmpty &&
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
                                  childCount: images.length,
                                  (context, index) => _ImageCardWidget(
                                    isGridLayout: true,
                                    contentWithScores: images[index],
                                  ),
                                ),
                              ),
                            if ([
                              _SearchContentFilters.DOCUMENTS,
                              _SearchContentFilters.ALL,
                            ].contains(selectedFilter))
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top:
                                        selectedFilter ==
                                            _SearchContentFilters.ALL
                                        ? 30.h
                                        : 0,
                                    bottom: 12.h,
                                  ),
                                  child: _sectionHeadingText(
                                    "DOCUMENTS (${documents.length})",
                                  ),
                                ),
                              ),
                            if (documents.isNotEmpty &&
                                [
                                  _SearchContentFilters.DOCUMENTS,
                                  _SearchContentFilters.ALL,
                                ].contains(selectedFilter))
                              SliverList.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                                itemCount: documents.length,
                                itemBuilder: (context, index) =>
                                    _DocumentCardWidget(
                                      fileType: ContentFileType.PDF,
                                      contentWithScore: documents[index],
                                      bestScore: bestScore,
                                      worstScore: worstScore,
                                    ),
                              ),
                            if ([
                              _SearchContentFilters.NOTES,
                              _SearchContentFilters.ALL,
                            ].contains(selectedFilter))
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top:
                                        selectedFilter ==
                                            _SearchContentFilters.ALL
                                        ? 30.h
                                        : 0,
                                    bottom: 12.h,
                                  ),
                                  child: _sectionHeadingText(
                                    "NOTES (${notes.length})",
                                  ),
                                ),
                              ),
                            if (notes.isNotEmpty &&
                                [
                                  _SearchContentFilters.NOTES,
                                  _SearchContentFilters.ALL,
                                ].contains(selectedFilter))
                              SliverList.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                                itemCount: notes.length,
                                itemBuilder: (context, index) =>
                                    _DocumentCardWidget(
                                      contentWithScore: notes[index],
                                      fileType: ContentFileType.NOTE,
                                      bestScore: bestScore,
                                      worstScore: worstScore,
                                    ),
                              ),
                          ],
                        );
                      },
                    ),
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

int _calculateSimilarityPercent({
  required double score,
  required double bestScore,
  required double worstScore,
}) {
  late final double matchScore;
  if (bestScore <= worstScore) {
    return 100;
  } else {
    matchScore = (score - worstScore) / (bestScore - worstScore);
  }

  return (matchScore * 100).round();
}

class _ImageCardWidget extends StatelessWidget {
  final ContentWithScroreModel contentWithScores;
  final bool isGridLayout;

  const _ImageCardWidget({
    super.key,
    required this.contentWithScores,
    this.isGridLayout = false,
  });

  @override
  Widget build(BuildContext context) {
    final contentData = contentWithScores.content;
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
                image: FileImage(File(contentData.path)),
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
              contentData.contentName,
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
  final ContentWithScroreModel contentWithScore;
  final double bestScore;
  final double worstScore;
  final ContentFileType fileType;

  const _DocumentCardWidget({
    super.key,
    required this.contentWithScore,
    required this.fileType,
    required this.worstScore,
    required this.bestScore,
  });

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
    final contentData = contentWithScore.content;
    final matchPercent = _calculateSimilarityPercent(
      score: contentWithScore.score,
      bestScore: bestScore,
      worstScore: worstScore,
    );
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
                        contentData.contentName,
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
                      DateFormat("MMM d").format(contentData.createdAt),
                    ),
                    _fileMetadataWidget(
                      Icons.access_time_filled_rounded,
                      DateFormat("h:mm a").format(contentData.createdAt),
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
