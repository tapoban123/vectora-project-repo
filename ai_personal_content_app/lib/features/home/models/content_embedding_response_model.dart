import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_embedding_response_model.g.dart';

part 'content_embedding_response_model.freezed.dart';

@freezed
abstract class ContentEmbeddingResponseModel
    with _$ContentEmbeddingResponseModel {
  factory ContentEmbeddingResponseModel({
    String? id,
    String? cid, // content Id
    String? description,
    required List<double> embeddings,
  }) = _ContentEmbeddingResponseModel;

  factory ContentEmbeddingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContentEmbeddingResponseModelFromJson(json);
}
