// enum FilterFileType { PDF, IMAGE, TEXT, NOTE, ALL }

import 'package:ai_personal_content_app/core/common/constants.dart';

enum FilterTime { TODAY, LAST_7_DAYS, LAST_30_DAYS, RANDOM }

enum SortOption {
  NONE,
  RECENTLY_ADDED,
  OLDEST_FIRST,
  RECENTLY_UPDATED,
  NAME_A_Z,
  NAME_Z_A,
  FILE_SIZE_DESC,
  FILE_SIZE_ASC,
}

class FilterAndSortOptions {
  final ContentFileType? fileType;
  final bool? pinnedOnly;
  final FilterTime? time;
  final SortOption? sortOption;

  FilterAndSortOptions({
    this.fileType,
    this.time,
    this.pinnedOnly,
    this.sortOption,
  });
}
