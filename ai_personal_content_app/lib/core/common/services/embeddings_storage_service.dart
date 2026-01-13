import 'dart:developer';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/models/nearest_embedding_contents_model.dart';
import 'package:ai_personal_content_app/features/search/entities/content_embeddings_entity.dart';
import 'package:ai_personal_content_app/main.dart';
import 'package:ai_personal_content_app/objectbox.g.dart';

class EmbeddingsLocalStorageService {
  EmbeddingsLocalStorageService();

  final _embeddingsBox = objectBoxInstance.store.box<ContentEmbeddingsEntity>();

  void insertEmbeddings(List<ContentEmbeddingsEntity> embeddings) {
    _embeddingsBox.putMany(embeddings);
  }

  void deleteEmbedding(String cid) {
    final query = _embeddingsBox
        .query(ContentEmbeddingsEntity_.contentId.equals(cid))
        .build();
    final embedding = query.findFirst();
    query.close();
    _embeddingsBox.remove(embedding!.id);
  }

  void deleteMultipleEmbedding(List<int> ids) {
    _embeddingsBox.removeMany(ids);
  }

  List<ContentEmbeddingsEntity> fetchAllEmbeddings() {
    return _embeddingsBox.getAll();
  }

  QueryBuilder _getQuery(ContentFileType type, List<double> queryEmbedding) =>
      _embeddingsBox.query(
        ContentEmbeddingsEntity_.contentVectors
            .nearestNeighborsF32(queryEmbedding, 5)
            .and(ContentEmbeddingsEntity_.contentType.equals(type.name)),
      );

  NearestContentsByTypeModel fetchNearestEmbeddings(
    List<double> queryEmbedding,
  ) {
    final imageQuery = _getQuery(ContentFileType.IMAGE, queryEmbedding).build();
    final documentsQuery = _getQuery(
      ContentFileType.PDF,
      queryEmbedding,
    ).build();
    final notesQuery = _getQuery(ContentFileType.NOTE, queryEmbedding).build();

    final imageResults = imageQuery.findWithScores();
    final documentsResults = documentsQuery.findWithScores();
    final notesResults = notesQuery.findWithScores();

    imageQuery.close();
    documentsQuery.close();
    notesQuery.close();

    log(imageResults.toString());
    log(documentsResults.toString());
    log(notesResults.toString());
    // log(documentsResults.first.object.contentType);
    return NearestContentsByTypeModel(
      images: imageResults
          .map(
            (e) => NearestEmbeddingContentsModel(
              cid: e.object.contentId,
              distance: e.score,
            ),
          )
          .toList(),
      documents: documentsResults
          .map(
            (e) => NearestEmbeddingContentsModel(
              cid: e.object.contentId,
              distance: e.score,
            ),
          )
          .toList(),
      notes: notesResults
          .map(
            (e) => NearestEmbeddingContentsModel(
              cid: e.object.contentId,
              distance: e.score,
            ),
          )
          .toList(),
    );
  }
}
