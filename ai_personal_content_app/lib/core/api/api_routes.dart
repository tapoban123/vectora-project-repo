abstract class ApiRoutes {
  static const String content = "/content";
  static const String embeddings = "/content/embeddings";
  static const String generateImageEmbeddings = "$embeddings/image";
  static const String generateTextEmbeddings =  "$embeddings/text";
  static const String generatePdfEmbeddings =  "$embeddings/pdf";

  static const String auth =  "/auth";
  static const String signIn =  "$auth/sign-in";
}
