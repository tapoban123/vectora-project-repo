import 'package:ai_personal_content_app/features/search/models/filter_and_sort_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contents_manager_events.freezed.dart';

@freezed
abstract class ContentsManagerEvents with _$ContentsManagerEvents {
  factory ContentsManagerEvents.fetchAllContents({
    FilterAndSortOptions? filterAndSortOptions,
  }) = FetchAllContents;

  factory ContentsManagerEvents.removeContent({required int id}) =
      RemoveContent;

  factory ContentsManagerEvents.removeMultipleContent({
    required List<int> ids,
  }) = RemoveMultipleContent;
}
