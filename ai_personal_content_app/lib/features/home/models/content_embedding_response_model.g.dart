// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_embedding_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentEmbeddingResponseModel _$ContentEmbeddingResponseModelFromJson(
  Map<String, dynamic> json,
) => _ContentEmbeddingResponseModel(
  id: json['id'] as String?,
  cid: json['cid'] as String?,
  description: json['description'] as String?,
  embeddings: (json['embeddings'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$ContentEmbeddingResponseModelToJson(
  _ContentEmbeddingResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'cid': instance.cid,
  'description': instance.description,
  'embeddings': instance.embeddings,
};
