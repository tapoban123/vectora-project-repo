abstract class ApiRoutes {
  static const String content = "/content";
  static const String embeddings = "/content/embeddings";
  static const String generateImageEmbeddings = "$embeddings/image";
  static const String generateTextEmbeddings = "$embeddings/text";
  static const String generatePdfEmbeddings = "$embeddings/pdf";

  static const String auth = "/auth";
  static const String signIn = "$auth/sign-in";
  static const String deleteUser = "$auth/delete";
  static const String generateNewAccessToken = "$auth/access-token/generate";

  static const String userCreditsAndQuotas = "/credits-and-quotas";
  static const String fetchUserCreditsAndQuotas = "$userCreditsAndQuotas/user";
  static const String updateRemainingCreditsOnUsage =
      "$userCreditsAndQuotas/use-credits";
  static const String grantCreditsOnAdWatch =
      "$userCreditsAndQuotas/grant-reward";
}
