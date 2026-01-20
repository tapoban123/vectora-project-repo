import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/home/controllers/cubits/recent_items_cubit.dart';
import 'package:ai_personal_content_app/core/common/widgets/content_card_for_grid_layout.dart';
import 'package:ai_personal_content_app/features/items/controllers/cubits/pinned_items_cubit.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RecentItemsCubit>().fetchRecentItems();
      context.read<PinItemsCubit>().fetchPinnedContents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: commonSystemUiOverlayStyle,
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Home",
          actions: [
            GestureDetector(
              onTap: () {
                context.push(RouteNames.contentLibrary);
              },
              child: Icon(Icons.local_library, color: Colors.white),
            ),
          ],
          leading: Icon(Icons.account_circle, color: Colors.white),
          onLeadingTap: () {
            context.push(RouteNames.userProfile);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(RouteNames.addNewContent);
          },
          backgroundColor: AppColors.blueColor,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white, size: 28.w),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            18.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: ElevatedButton(
                onPressed: () {
                  context.push(RouteNames.searchContent);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 52.h),
                  backgroundColor: AppColors.blueGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                ),
                child: Row(
                  spacing: 8.w,
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: AppColors.inactiveColor,
                      size: 24.w,
                    ),
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
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: BlocBuilder<PinItemsCubit, List<ContentsEntity>>(
                builder: (context, state) {
                  if (state.isEmpty) {
                    return SizedBox.shrink();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.w,
                    children: [
                      _sectionHeadingRow(
                        title: "Pinned",
                        dialogTitle: "Unpin All Items",
                        message: "Are you sure you want to unpin all contents?",
                        onConfirmDelete: () {
                          context.read<PinItemsCubit>().unPinAllContents();
                          context.pop();
                        },
                      ),
                      SizedBox(
                        height: 88.h,
                        child: ListView.builder(
                          itemCount: state.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: _PinnedItemCard(content: state[index]),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: BlocBuilder<RecentItemsCubit, List<ContentsEntity>>(
                  builder: (context, state) {
                    if (state.isEmpty) {
                      return SizedBox.shrink();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.w,
                      children: [
                        _sectionHeadingRow(
                          title: "Recent",
                          dialogTitle: "Remove Recent Items",
                          message:
                              "Are you sure you want to remove recently accessed items?\n\nNOTE: This won't affect your contents present in the content library.",
                          onConfirmDelete: () {
                            context
                                .read<RecentItemsCubit>()
                                .clearAllRecentItems();
                            context.pop();
                          },
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: state.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 14.w,
                                  mainAxisSpacing: 14.w,
                                  childAspectRatio: 0.74,
                                ),
                            itemBuilder: (context, index) =>
                                ContentCardForGridLayout(content: state[index]),
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
      ),
    );
  }

  Widget _sectionHeadingRow({
    required String title,
    required String dialogTitle,
    required String message,
    required VoidCallback onConfirmDelete,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22.sp,
            fontVariations: [FontVariation.weight(700)],
          ),
        ),
        IconButton(
          onPressed: () {
            showAppDialog(
              context,
              title: dialogTitle,
              message: message,
              onConfirmTap: onConfirmDelete,
              includeCancelButton: true,
              confirmButtonColor: AppColors.deepRedColor,
              buttonText: "Continue",
            );
          },
          style: IconButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: AppColors.deepRedColor,
          ),
          icon: Icon(Icons.delete, color: AppColors.deepRedColor),
        ),
      ],
    );
  }
}

class _PinnedItemCard extends StatelessWidget {
  final ContentsEntity content;

  const _PinnedItemCard({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final ({Icon icon, Color bgColor}) contentIconProps;
    if (content.type == ContentFileType.IMAGE.name) {
      contentIconProps = (
        icon: Icon(Icons.image_outlined, color: Colors.deepOrangeAccent),
        bgColor: Colors.deepOrangeAccent,
      );
    } else if (content.type == ContentFileType.NOTE.name) {
      contentIconProps = (
        icon: Icon(Icons.note_alt_outlined, color: AppColors.blueColor),
        bgColor: AppColors.blueColor,
      );
    } else {
      contentIconProps = (
        icon: Icon(Icons.picture_as_pdf_outlined, color: AppColors.redColor),
        bgColor: AppColors.redColor,
      );
    }
    return GestureDetector(
      onTap: () {
        context.push(RouteNames.viewItemOptions, extra: {"content": content});
      },
      child: Container(
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
                    color: contentIconProps.bgColor.withValues(alpha: 0.2),
                  ),
                  child: contentIconProps.icon,
                ),
                Text(
                  content.extension,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontVariations: [FontVariation.weight(500)],
                    color: AppColors.inactiveColor,
                  ),
                ),
              ],
            ),
            Text(
              content.contentName,
              style: TextStyle(
                fontSize: 16.sp,
                fontVariations: [FontVariation.weight(600)],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
