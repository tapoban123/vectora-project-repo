// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_and_sort_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FilterAndSortOptions _$FilterAndSortOptionsFromJson(
  Map<String, dynamic> json,
) => _FilterAndSortOptions(
  fileType: $enumDecodeNullable(_$ContentFileTypeEnumMap, json['fileType']),
  pinnedOnly: json['pinnedOnly'] as bool?,
  time: $enumDecodeNullable(_$FilterTimeEnumMap, json['time']),
  sortOption: $enumDecodeNullable(_$SortOptionEnumMap, json['sortOption']),
);

Map<String, dynamic> _$FilterAndSortOptionsToJson(
  _FilterAndSortOptions instance,
) => <String, dynamic>{
  'fileType': _$ContentFileTypeEnumMap[instance.fileType],
  'pinnedOnly': instance.pinnedOnly,
  'time': _$FilterTimeEnumMap[instance.time],
  'sortOption': _$SortOptionEnumMap[instance.sortOption],
};

const _$ContentFileTypeEnumMap = {
  ContentFileType.IMAGE: 'IMAGE',
  ContentFileType.PDF: 'PDF',
  ContentFileType.SCANNED_PDF: 'SCANNED_PDF',
  ContentFileType.NOTE: 'NOTE',
  ContentFileType.UNKNOWN: 'UNKNOWN',
};

const _$FilterTimeEnumMap = {
  FilterTime.TODAY: 'TODAY',
  FilterTime.LAST_7_DAYS: 'LAST_7_DAYS',
  FilterTime.LAST_30_DAYS: 'LAST_30_DAYS',
  FilterTime.RANDOM: 'RANDOM',
};

const _$SortOptionEnumMap = {
  SortOption.RECENTLY_ADDED: 'RECENTLY_ADDED',
  SortOption.OLDEST_FIRST: 'OLDEST_FIRST',
  SortOption.RECENTLY_UPDATED: 'RECENTLY_UPDATED',
  SortOption.NAME_A_Z: 'NAME_A_Z',
  SortOption.NAME_Z_A: 'NAME_Z_A',
  SortOption.FILE_SIZE_DESC: 'FILE_SIZE_DESC',
  SortOption.FILE_SIZE_ASC: 'FILE_SIZE_ASC',
};
