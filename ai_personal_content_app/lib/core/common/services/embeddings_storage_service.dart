import 'package:ai_personal_content_app/features/search/entities/content_embeddings_entity.dart';
import 'package:ai_personal_content_app/main.dart';
import 'package:ai_personal_content_app/objectbox.g.dart';

class EmbeddingsLocalStorageService {
  EmbeddingsLocalStorageService();

  final _embeddingsBox = objectBoxInstance.store.box<ContentEmbeddingsEntity>();

  void insertEmbeddings(List<ContentEmbeddingsEntity> embeddings) {
    _embeddingsBox.putMany(embeddings);
  }

  void fetchAllEmbeddings() {
    _embeddingsBox.getAll();
  }

  List<ObjectWithScore> fetchNearestEmbeddings(List<double> queryEmbedding) {
    final query = _embeddingsBox
        .query(
          ContentEmbeddingsEntity_.contentVectors.nearestNeighborsF32(
            queryEmbedding,
            3,
          ),
        )
        .build();
    final results = query.findWithScores();

    return results;
  }
}
