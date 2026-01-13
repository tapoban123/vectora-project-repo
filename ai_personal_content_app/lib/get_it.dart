import 'package:ai_personal_content_app/core/common/services/embedding_generation_service.dart';
import 'package:ai_personal_content_app/core/common/services/embeddings_storage_service.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_bloc.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_bloc.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_bloc.dart';
import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory<NewContentsBloc>(
    () => NewContentsBloc(
      embeddingGenerationService: getIt(),
      embeddingsLocalStorageService: getIt(),
      contentsLocalStorageService: getIt(),
    ),
  );
  getIt.registerFactory<SearchContentsBloc>(
    () => SearchContentsBloc(
      embeddingGenerationService: getIt(),
      embeddingsLocalStorageService: getIt(),
      contentsLocalStorageService: getIt(),
    ),
  );
  getIt.registerFactory<ContentsManagerBloc>(
    () => ContentsManagerBloc(
      contentsLocalStorageService: getIt(),
      embeddingsLocalStorageService: getIt(),
    ),
  );
  getIt.registerSingleton<EmbeddingGenerationService>(
    EmbeddingGenerationService(),
  );
  getIt.registerSingleton<EmbeddingsLocalStorageService>(
    EmbeddingsLocalStorageService(),
  );
  getIt.registerSingleton<ContentsLocalStorageService>(
    ContentsLocalStorageService(),
  );
}
