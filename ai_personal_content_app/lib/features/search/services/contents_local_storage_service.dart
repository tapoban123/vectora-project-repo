import 'dart:io';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/main.dart';
import 'package:ai_personal_content_app/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ContentsLocalStorageService {
  final _contentsBox = objectBoxInstance.store.box<ContentsEntity>();

  Future<String> storeFileToAppDirectory(File file,
      ContentFileType fileType,) async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final dirPath = appDirectory.path;

    final newFile = File("$dirPath/${const Uuid().v4()}");
    if ([ContentFileType.IMAGE, ContentFileType.PDF].contains(fileType)) {
      final contentBytes = await file.readAsBytes();
      await newFile.writeAsBytes(contentBytes);
    } else if (fileType == ContentFileType.NOTE) {
      final contentsString = await file.readAsString();
      await newFile.writeAsString(contentsString);
    }

    return newFile.path;
  }

  void insertContents(List<ContentsEntity> contents) {
    _contentsBox.putMany(contents);
  }

  void pinContent(int id) {
    final content = _contentsBox.get(id);
    if (content != null) {
      content.isPinned = true;
      _contentsBox.put(content, mode: PutMode.update);
    }
  }

  void removeContent(int id) {
    _contentsBox.remove(id);
  }

  void removeMultipleContent(List<int> ids) {
    _contentsBox.removeMany(ids);
  }

  List<ContentsEntity> fetchAllContents() {
    return _contentsBox.getAll();
  }

  List<ContentsEntity> fetchContentsByCid(List<String> cids) {
    final query = _contentsBox
        .query(ContentsEntity_.contentId.oneOf(cids))
        .order(ContentsEntity_.createdAt, flags: Order.descending)
        .build();

    final results = query.find();
    query.close();

    return results;
  }
}
