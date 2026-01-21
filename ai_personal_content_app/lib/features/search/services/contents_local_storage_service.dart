import 'dart:io';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/features/search/models/filter_and_sort_options.dart';
import 'package:ai_personal_content_app/main.dart';
import 'package:ai_personal_content_app/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ContentsLocalStorageService {
  final _contentsBox = objectBoxInstance.store.box<ContentsEntity>();

  Future<String> storeFileToAppDirectory(
    File file,
    ContentFileType fileType,
  ) async {
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
      content.pinDateTime = DateTime.now();
      _contentsBox.put(content, mode: PutMode.update);
    }
  }

  void unPinContent(int id) {
    final content = _contentsBox.get(id);
    if (content != null) {
      content.isPinned = false;
      content.pinDateTime = null;
      _contentsBox.put(content, mode: PutMode.put);
    }
  }

  bool isContentPinned(int id) {
    final content = _contentsBox.get(id);
    if (content != null && content.isPinned) {
      return true;
    }
    return false;
  }

  List<ContentsEntity> getPinnedContents() {
    final query = _contentsBox
        .query(ContentsEntity_.isPinned.equals(true))
        .order(ContentsEntity_.pinDateTime, flags: Order.descending)
        .build();

    final results = query.find();
    query.close();

    return results;
  }

  void unPinAllContents() {
    final pinnedContents = getPinnedContents();
    final unPinnedContents = pinnedContents.map((e) {
      e.isPinned = false;
      e.pinDateTime = null;
      return e;
    }).toList();

    _contentsBox.putMany(unPinnedContents, mode: PutMode.update);
  }

  void removeContent(int id) {
    _contentsBox.remove(id);
  }

  void removeMultipleContent(List<int> ids) {
    _contentsBox.removeMany(ids);
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

  List<ContentsEntity> fetchAllContents({FilterAndSortOptions? options}) {
    if (options == null) {
      return _contentsBox.getAll();
    }
    QueryBuilder<ContentsEntity>? query;

    Condition<ContentsEntity>? fileTypeCondition;
    Condition<ContentsEntity>? pinnedOnlyCondition;
    Condition<ContentsEntity>? timeCondition;
    ({QueryProperty<ContentsEntity, dynamic> property, int flag})? sortOrder;

    if (options.fileType != null) {
      fileTypeCondition = ContentsEntity_.type.oneOf(
        ContentFileType.values.map((e) => e.toString()).toList(),
      );
    }
    if (options.time != null) {
      switch (options.time) {
        case FilterTime.LAST_7_DAYS:
          final dateBefore7d = DateTime.now().subtract(Duration(days: 7));
          timeCondition = ContentsEntity_.createdAt.greaterOrEqualDate(
            dateBefore7d,
          );
          break;

        case FilterTime.LAST_30_DAYS:
          final dateBefore30d = DateTime.now().subtract(Duration(days: 30));
          timeCondition = ContentsEntity_.createdAt.greaterOrEqualDate(
            dateBefore30d,
          );
          break;

        default:
          final today = DateTime.now();
          timeCondition = ContentsEntity_.createdAt.equalsDate(today);
          break;
      }
    }

    if (options.pinnedOnly != null) {
      pinnedOnlyCondition = ContentsEntity_.isPinned.equals(true);
    }

    if (options.sortOption != null) {
      switch (options.sortOption) {
        case SortOption.FILE_SIZE_ASC:
          sortOrder = (property: ContentsEntity_.contentSizeInBytes, flag: 0);
          break;
        case SortOption.FILE_SIZE_DESC:
          sortOrder = (
            property: ContentsEntity_.contentSizeInBytes,
            flag: Order.descending,
          );
          break;
        case SortOption.NAME_A_Z:
          sortOrder = (property: ContentsEntity_.contentName, flag: 0);
          break;
        case SortOption.NAME_Z_A:
          sortOrder = (
            property: ContentsEntity_.contentName,
            flag: Order.descending,
          );
          break;
        case SortOption.OLDEST_FIRST:
          sortOrder = (
            property: ContentsEntity_.createdAt,
            flag: Order.descending,
          );
          break;
        case SortOption.RECENTLY_ADDED:
          sortOrder = (property: ContentsEntity_.createdAt, flag: 0);
          break;
        case SortOption.RECENTLY_UPDATED:
          sortOrder = (property: ContentsEntity_.updatedAt, flag: 0);
          break;
        default:
          break;
      }
    }

    final conditions = [
      fileTypeCondition,
      timeCondition,
      pinnedOnlyCondition,
    ].nonNulls.toList();

    if (conditions.nonNulls.length == 1) {
      query = _contentsBox.query(conditions.first);
    } else if (conditions.nonNulls.length == 2) {
      query = _contentsBox.query(conditions.first.and(conditions[1]));
    } else if (conditions.nonNulls.length == 3) {
      query = _contentsBox.query(
        conditions.first.and(conditions[1]).and(conditions[2]),
      );
    }

    if (sortOrder != null) {
      query ??= _contentsBox.query();
      if (sortOrder.flag == 0) {
        query = query.order(sortOrder.property);
      } else {
        query = query.order(sortOrder.property, flags: sortOrder.flag);
      }
    }

    if (query != null) {
      final finalQuery = query.build();
      final results = finalQuery.find();
      return results;
    }
    return _contentsBox.getAll();
  }
}
