import 'dart:io';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_svgs.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_bloc.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_events.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ViewItemScreen extends StatefulWidget {
  final ContentsEntity content;

  const ViewItemScreen({super.key, required this.content});

  @override
  State<ViewItemScreen> createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late final ContentsEntity content;
  late final bool _contentIsNote;
  late final bool _contentIsImage;
  late final bool contentIsPdf;

  @override
  void initState() {
    content = widget.content;
    _contentIsNote = content.type == ContentFileType.NOTE.name;
    _contentIsImage = content.type == ContentFileType.IMAGE.name;
    contentIsPdf = content.type == ContentFileType.PDF.name;

    _scaffoldKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final optionsData = [
      (
        icon: Icons.chat_outlined,
        color: null,
        label: "Chat",
        onTap: () {
          _scaffoldKey.currentState?.showBottomSheet(
            (context) => _ChatBottomSheetContent(scaffoldKey: _scaffoldKey),
          );
        },
      ),
      (icon: Icons.push_pin_outlined, color: null, label: "Pin", onTap: () {}),
      (
        icon: Icons.delete_outline,
        color: AppColors.deepRedColor,
        label: "Delete",
        onTap: () {
          showAppDialog(
            context,
            includeCancelButton: true,
            confirmButtonColor: AppColors.deepRedColor,
            title: "Delete Content",
            message: "Are you sure you want to delete this content?",
            buttonText: "Continue",
            onConfirmTap: () {
              context.read<ContentsManagerBloc>().add(
                DeleteContent(cid: content.contentId, objectBoxId: content.id),
              );
              context.pop();
            },
          );
        },
      ),
    ];

    if (_contentIsNote) {
      optionsData.insert(0, (
        icon: Icons.edit,
        color: null,
        label: "Edit",
        onTap: () {
          context.push(RouteNames.createOrEditNote, extra: File(content.path));
        },
      ));
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppbar(
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: content.contentName,
        actions: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
            ),
            icon: Icon(Icons.share, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kTabLabelPadding.left,
        ).copyWith(top: 15.h),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (_contentIsImage) {
                    context.push(
                      RouteNames.viewPhoto,
                      extra: {
                        "path": content.path,
                        "name": content.contentName,
                      },
                    );
                  } else if (_contentIsNote) {
                    context.push(
                      RouteNames.createOrEditNote,
                      extra: File(content.path),
                    );
                  }
                },
                child: Container(
                  height: getScreenHeight(context) * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: _contentIsImage
                          ? FileImage(File(content.path))
                          : NetworkImage(RANDOM_IMAGE_URL),
                      fit: BoxFit.cover,
                    ),
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
                          value: DateFormat(
                            "MMM d, y",
                          ).format(content.createdAt),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: _itemDetailWidget(
                          label: "Type",
                          value: content.extension.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Divider(color: AppColors.borderColor),
                  16.verticalSpace,
                  _itemDetailWidget(
                    label: "Size",
                    value: "${bytesToMegabytes(content.contentSizeInBytes)} MB",
                  ),
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

class _AiResponseMessageBox extends StatelessWidget {
  const _AiResponseMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.blueGreyColor,
          child: robotFaceSvg(),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.h,
            children: [
              Text(
                "AI Assistant",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.inactiveColor,
                  fontVariations: [FontVariation.weight(400)],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
                decoration: BoxDecoration(
                  color: AppColors.blueGreyColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.r),
                  ).copyWith(bottomRight: Radius.circular(8.r)),
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque posuere enim arcu, sed vehicula enim iaculis sit amet. Donec mattis nibh vel maximus tincidunt. Nunc feugiat quam est. Proin tincidunt velit eget libero.",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontVariations: [FontVariation.weight(500)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HumanMessageBox extends StatelessWidget {
  const _HumanMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 4.h,
            children: [
              Text(
                "Me",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.inactiveColor,
                  fontVariations: [FontVariation.weight(400)],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.r),
                  ).copyWith(bottomLeft: Radius.circular(8.r)),
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontVariations: [FontVariation.weight(500)],
                  ),
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.blueGreyColor,
          child: Text(
            "I",
            style: TextStyle(
              fontSize: 20.sp,
              fontVariations: [FontVariation.weight(600)],
            ),
          ),
        ),
      ],
    );
  }
}

class _ChatBottomSheetContent extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _ChatBottomSheetContent({super.key, required this.scaffoldKey});

  @override
  State<_ChatBottomSheetContent> createState() =>
      _ChatBottomSheetContentState();
}

class _ChatBottomSheetContentState extends State<_ChatBottomSheetContent> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _userMsgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (event) {
        widget.scaffoldKey.currentContext?.pop();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        height: getScreenHeight(context) * 0.85,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 4.w,
              decoration: BoxDecoration(color: AppColors.lightBlueGreyColor),
            ),
            14.verticalSpace,
            SizedBox(
              width: 335.w,
              child: Text(
                "Chats are not saved. All messages are deleted when you leave.",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontVariations: [FontVariation.weight(500)],
                  color: AppColors.inactiveColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: AppColors.borderColor),
            Expanded(
              child: ListView.separated(
                itemCount: 50,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                reverse: true,
                itemBuilder: (context, index) => _AiResponseMessageBox(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.h,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Row(
                    spacing: 8.w,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.note_add_outlined, color: Colors.white),
                      Text(
                        "Save as Note",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontVariations: [FontVariation.weight(600)],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 12.w,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _userMsgController,
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.blueGreyColor,
                          hintText: "Ask anything...",
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.inactiveColor,
                            fontVariations: [FontVariation.weight(500)],
                          ),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontVariations: [FontVariation.weight(500)],
                        ),
                        keyboardType: TextInputType.text,
                        onTapOutside: (event) {
                          _focusNode.unfocus();
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size.square(50.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                      ),
                      child: Icon(
                        Icons.arrow_upward_sharp,
                        color: Colors.white,
                        size: 25.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
