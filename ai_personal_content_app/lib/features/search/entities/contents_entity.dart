import 'package:objectbox/objectbox.dart';

@Entity()
class ContentsEntity {
  @Id()
  int id = 0;

  @Unique()
  @Index()
  String contentId;

  String path;
  String contentName;
  String? imageDescription;
  String? scannedImageTexts;
  String extension;
  String type;

  @Index()
  bool isPinned = false;

  @Property(type: PropertyType.int)
  int contentSizeInBytes;

  @Property(type: PropertyType.date)
  DateTime createdAt;
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  ContentsEntity({
    required this.contentId,
    required this.path,
    required this.contentName,
    this.imageDescription,
    this.scannedImageTexts,
    this.isPinned = false,
    required this.contentSizeInBytes,
    required this.extension,
    required this.type,
    required this.createdAt,
    this.updatedAt,
  });
}
