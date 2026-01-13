import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/features/search/models/contents_with_scrore_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_contents_states.freezed.dart';

@freezed
abstract class SearchContentsStates with _$SearchContentsStates{
  factory SearchContentsStates.initial() = _Initial;

  factory SearchContentsStates.loading() = _Loading;

  factory SearchContentsStates.embeddingsGenerated({
    required List<ContentWithScroreModel> images,
    required List<ContentWithScroreModel> documents,
    required List<ContentWithScroreModel> notes,
  }) = _EmbeddingsGenerated;

  factory SearchContentsStates.error({
    required String message,
    int? statusCode,
  }) = _Error;
}
