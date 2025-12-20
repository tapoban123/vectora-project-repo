import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_cubit.dart';
import 'package:ai_personal_content_app/features/home/models/preview_file_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddNewContentScreen extends StatelessWidget {
  const AddNewContentScreen({super.key});

  void _clearContentsAndPopScreen(BuildContext context) {
    context.read<NewContentsCubit>().close();
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final addNewContentCubit = context.read<NewContentsCubit>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _clearContentsAndPopScreen(context);
        }
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: "",
          leading: Icon(Icons.close, color: Colors.white),
          onLeadingTap: () {
            _clearContentsAndPopScreen(context);
          },
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Expanded(
            child: Column(
              spacing: 8.h,
              children: [
                _AddContentOptionButton(
                  title: "Take Photo",
                  icon: Icons.camera_alt_outlined,
                  onTap: () {
                    addNewContentCubit.captureImage();
                  },
                ),
                _AddContentOptionButton(
                  title: "Scan Document",
                  icon: Icons.document_scanner_outlined,
                  onTap: () {
                    addNewContentCubit.scanDocuments();
                  },
                ),
                _AddContentOptionButton(
                  title: "Upload File",
                  icon: Icons.upload_file,
                  onTap: () {
                    addNewContentCubit.uploadFiles();
                  },
                ),
                _AddContentOptionButton(
                  title: "Create/Paste notes",
                  icon: Icons.paste_outlined,
                  onTap: () {
                    addNewContentCubit.createOrPasteNotes();
                  },
                ),
                50.verticalSpace,
                Expanded(
                  child: BlocBuilder<NewContentsCubit, List<PreviewFileModel>>(
                    builder: (context, state) {
                      if (state.isEmpty) {
                        return SizedBox.shrink();
                      }
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          ListView.builder(
                            itemCount: state.length,
                            itemBuilder: (context, index) {
                              final file = state[index];

                              return Container(
                                padding: EdgeInsets.all(9.w),
                                margin: EdgeInsets.only(bottom: 12.w),
                                decoration: BoxDecoration(
                                  color: AppColors.metalColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Row(
                                  spacing: 12.w,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 80.h,
                                      width: 64.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.inactiveColor
                                            .withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        image:
                                            file.fileType ==
                                                ContentFileType.IMAGE
                                            ? DecorationImage(
                                                image: FileImage(file.file),
                                                fit: BoxFit.cover,
                                              )
                                            : null,
                                      ),
                                      child:
                                          [
                                            ContentFileType.PDF,
                                            ContentFileType.UNKNOWN,
                                          ].contains(file.fileType)
                                          ? Icon(
                                              Icons.insert_drive_file,
                                              color: AppColors.inactiveColor,
                                              size: 60.w,
                                            )
                                          : null,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width:
                                                    getScreenWidth(context) *
                                                    0.55,
                                                child: Text(
                                                  file.name,
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.white,
                                                    fontVariations: [
                                                      FontVariation.weight(600),
                                                    ],
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<NewContentsCubit>()
                                                      .removeContent(index);
                                                },
                                                style: IconButton.styleFrom(
                                                  backgroundColor: AppColors
                                                      .lightBlueGreyColor,
                                                  minimumSize: Size.fromRadius(
                                                    0,
                                                  ),
                                                  padding: EdgeInsets.all(4.r),
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                                icon: Icon(
                                                  Icons.close,
                                                  color:
                                                      AppColors.lightGreyColor,
                                                  size: 18.w,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${bytesToMegabytes(file.sizeInBytes)} MB - Uploaded",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.inactiveColor,
                                              height: 1.8,
                                              fontVariations: [
                                                FontVariation.weight(400),
                                              ],
                                            ),
                                          ),
                                          10.verticalSpace,
                                          SizedBox(
                                            width:
                                                getScreenWidth(context) * 0.5,
                                            child: LinearProgressIndicator(
                                              color: AppColors.blueColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.blueColor,
                                minimumSize: Size(double.infinity, 50.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                "Add to library",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontVariations: [FontVariation.weight(700)],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddContentOptionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _AddContentOptionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.metalColor,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.w,
        ).copyWith(right: 20.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16.w,
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.blueColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: AppColors.blueColor, size: 22.w),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontVariations: [FontVariation.weight(600)],
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14.w,
            color: AppColors.lightGreyColor,
          ),
        ],
      ),
    );
  }
}
