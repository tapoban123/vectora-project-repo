import 'package:ai_personal_content_app/features/home/models/preview_file_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_contents_states.freezed.dart';

@freezed
sealed class NewContentsStates with _$NewContentsStates {
  factory NewContentsStates.initial() = _Initial;

  factory NewContentsStates.newContents({
    required List<PreviewFileModel> contents,
  }) = _NewContents;

  factory NewContentsStates.loading({
    required PreviewFileModel content,
  }) = _Loading;

  factory NewContentsStates.error({required String message}) = _Error;
}
