import 'dart:convert';
import 'dart:io';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/features/home/controllers/cubits/recent_items_cubit.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ContentCardForGridLayout extends StatelessWidget {
  final ContentsEntity content;

  const ContentCardForGridLayout({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final bool isContentImage = content.type == ContentFileType.IMAGE.name;
    final bool isContentNote = content.type == ContentFileType.NOTE.name;
    final bool isContentPdf = content.type == ContentFileType.PDF.name;

    Widget? iconWidget;

    if (isContentNote) {
      final json = File(content.path).readAsStringSync();
      final String noteText = Document.fromJson(jsonDecode(json)).toPlainText();
      iconWidget = Text(
        noteText,
        style: TextStyle(
          fontSize: 12.sp,
          fontVariations: [FontVariation.weight(500)],
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
      );
    }
    return GestureDetector(
      onTap: () {
        context.read<RecentItemsCubit>().setNewItem(content.contentId);
        context.push(RouteNames.viewItemOptions, extra: {"content": content});
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
              image: isContentImage
                  ? DecorationImage(
                      image: FileImage(File(content.path)),
                      fit: BoxFit.cover,
                    )
                  : null,
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
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Expanded(
    //       child: GestureDetector(
    //         onTap: () {
    //           context.push(RouteNames.viewItemOptions);
    //         },
    //         child: Container(
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: NetworkImage(
    //                 "https://picsum.photos/seed/picsum/200/300",
    //               ),
    //               fit: BoxFit.cover,
    //             ),
    //             borderRadius: BorderRadius.circular(12.r),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Text(
    //       "Project Plan.pdf",
    //       style: TextStyle(
    //         fontVariations: [FontVariation.weight(600)],
    //         fontSize: 16.sp,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     Text(
    //       "PDF",
    //       style: TextStyle(
    //         fontVariations: [FontVariation.weight(400)],
    //         fontSize: 14.sp,
    //         color: AppColors.inactiveColor,
    //       ),
    //     ),
    //   ],
    // );
  }
}
