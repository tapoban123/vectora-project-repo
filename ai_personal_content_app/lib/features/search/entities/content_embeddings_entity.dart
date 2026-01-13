import 'package:objectbox/objectbox.dart';

@Entity()
class ContentEmbeddingsEntity {
  @Id()
  int id = 0;

  @Index()
  String contentId;
  @Index()
  String contentType;

  @HnswIndex(dimensions: 512, distanceType: VectorDistanceType.cosine)
  @Property(type: PropertyType.floatVector)
  List<double> contentVectors;

  ContentEmbeddingsEntity({
    required this.contentId,
    required this.contentType,
    required this.contentVectors,
  });
}
