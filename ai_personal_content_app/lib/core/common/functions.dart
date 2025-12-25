import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget getContentIcon({
  required ContentFileType fileType,
  required double iconSize,
  Color? iconColor,
}) {
  switch (fileType) {
    case ContentFileType.PDF:
      return Icon(
        Icons.picture_as_pdf,
        color: iconColor ?? AppColors.inactiveColor,
        size: iconSize,
      );
    case ContentFileType.NOTE:
      return Icon(
        Icons.edit_note_outlined,
        color: iconColor ?? AppColors.inactiveColor,
        size: iconSize,
      );
    default:
      return Icon(
        Icons.insert_drive_file,
        color: iconColor ?? AppColors.inactiveColor,
        size: iconSize,
      );
  }
}
