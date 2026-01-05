import 'dart:io';
import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

part 'preview_file_model.freezed.dart';

@freezed
class PreviewFileModel with _$PreviewFileModel{
  final String cid;
  final File file;
  final String name;
  final int sizeInBytes;
  final String extension;
  final ContentFileType fileType;
  final bool isLoading;
  final double? loadingProgress;

  PreviewFileModel._({
    required this.cid,
    required this.file,
    required this.name,
    required this.sizeInBytes,
    required this.extension,
    required this.fileType,
    this.isLoading = false,
    this.loadingProgress,
  });

  factory PreviewFileModel.fromFile({required File file}) {
    final ext = p.extension(file.path).substring(1);

    return PreviewFileModel._(
      cid: Uuid().v4(),
      file: file,
      name: p.basename(file.path),
      sizeInBytes: file.lengthSync(),
      extension: ext.toUpperCase(),
      fileType: _detectFileType(ext),
    );
  }

  static ContentFileType _detectFileType(String ext) {
    switch (ext) {
      case 'jpg':
      case 'jpeg':
      case 'png':
        return ContentFileType.IMAGE;
      case 'pdf':
        return ContentFileType.PDF;
      case 'json':
        return ContentFileType.NOTE;
      default:
        return ContentFileType.UNKNOWN;
    }
  }
}
