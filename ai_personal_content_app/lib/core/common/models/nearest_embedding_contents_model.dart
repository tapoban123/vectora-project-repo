class NearestContentsByTypeModel {
  final List<NearestEmbeddingContentsModel> images;
  final List<NearestEmbeddingContentsModel> documents;
  final List<NearestEmbeddingContentsModel> notes;

  NearestContentsByTypeModel({
    required this.images,
    required this.documents,
    required this.notes,
  });
}

class NearestEmbeddingContentsModel {
  final String cid;
  final double distance;

  NearestEmbeddingContentsModel({required this.cid, required this.distance});
}
