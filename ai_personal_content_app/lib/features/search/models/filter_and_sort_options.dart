// enum FilterFileType { PDF, IMAGE, TEXT, NOTE, ALL }

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_and_sort_options.g.dart';

part 'filter_and_sort_options.freezed.dart';

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

@freezed
abstract class FilterAndSortOptions with _$FilterAndSortOptions {
  factory FilterAndSortOptions({
    ContentFileType? fileType,
    bool? pinnedOnly,
    FilterTime? time,
    SortOption? sortOption,
  }) = _FilterAndSortOptions;

  factory FilterAndSortOptions.fromJson(Map<String, dynamic> json) =>
      _$FilterAndSortOptionsFromJson(json);
}
