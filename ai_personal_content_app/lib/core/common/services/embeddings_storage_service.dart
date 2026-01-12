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

  void deleteEmbedding(int id) {
    _embeddingsBox.remove(id);
  }

  void deleteMultipleEmbedding(List<int> ids) {
    _embeddingsBox.removeMany(ids);
  }

  List<ContentEmbeddingsEntity> fetchAllEmbeddings() {
    return _embeddingsBox.getAll();
  }

  List<NearestEmbeddingContentsModel> fetchNearestEmbeddings(
    List<double> queryEmbedding,
  ) {
    final query = _embeddingsBox
        .query(
          ContentEmbeddingsEntity_.contentVectors.nearestNeighborsF32(
            queryEmbedding,
            3,
          ),
        )
        .build();
    final results = query.findWithScores();
    query.close();

    return results
        .map(
          (e) => NearestEmbeddingContentsModel(
            cid: e.object.contentId,
            score: e.score,
          ),
        )
        .toList();
  }
}
