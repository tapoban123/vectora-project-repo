import 'dart:io';
import 'package:path/path.dart' as p;

enum ContentFileType { IMAGE, PDF, NOTE, UNKNOWN }

class PreviewFileModel {
  final File file;
  final String name;
  final int sizeInBytes;
  final String extension;
  final ContentFileType fileType;

  PreviewFileModel._({
    required this.file,
    required this.name,
    required this.sizeInBytes,
    required this.extension,
    required this.fileType,
  });

  factory PreviewFileModel.fromFile({required File file}) {
    final ext = p.extension(file.path).substring(1);

    return PreviewFileModel._(
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
