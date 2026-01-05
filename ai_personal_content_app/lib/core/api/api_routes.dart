import 'package:flutter/foundation.dart';

class ApiRoutes {
  static const String content = "/content";
  static const String embeddings = "/content/embeddings";
  static const String generateImageEmbeddings = "$embeddings/image";
  static const String generateTextEmbeddings = kDebugMode
      ? "$content/dev/embeddings/text"
      : "$embeddings/text";
}
