import 'package:ai_personal_content_app/core/common/services/embedding_generation_service.dart';
import 'package:ai_personal_content_app/core/common/services/embeddings_storage_service.dart';
import 'package:ai_personal_content_app/core/common/services/jwt_token_storage_service.dart';
import 'package:ai_personal_content_app/features/auth/controllers/user_auth_bloc/user_auth_bloc.dart';
import 'package:ai_personal_content_app/features/auth/services/user_authentication_services.dart';
import 'package:ai_personal_content_app/features/auth/usecases/read_access_token.dart';
import 'package:ai_personal_content_app/features/auth/usecases/read_refresh_token.dart';
import 'package:ai_personal_content_app/features/home/controllers/cubits/recent_items_cubit.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_bloc.dart';
import 'package:ai_personal_content_app/features/home/services/recent_contents_local_db_service.dart';
import 'package:ai_personal_content_app/features/items/controllers/cubits/pinned_items_cubit.dart';
import 'package:ai_personal_content_app/features/items/usecases/is_content_pinned.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_bloc.dart';
import 'package:ai_personal_content_app/features/search/controllers/filter_and_sort_preferences_cubit.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_bloc.dart';
import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';
import 'package:ai_personal_content_app/features/search/services/content_library_user_prefs_localdb_service.dart';
import 'package:ai_personal_content_app/features/search/usecases/get_content_layout_pref.dart';
import 'package:ai_personal_content_app/features/search/usecases/is_pinned_content_exists.dart';
import 'package:ai_personal_content_app/features/search/usecases/set_contents_layout_pref.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  getIt.registerLazySingleton<IsContentPinned>(() => IsContentPinned(getIt()));

  getIt.registerSingletonWithDependencies<RecentContentsLocalDbService>(
    () => RecentContentsLocalDbService(prefs: getIt<SharedPreferences>()),
    dependsOn: [SharedPreferences],
  );
  getIt.registerLazySingleton<EmbeddingGenerationService>(
    () => EmbeddingGenerationService(),
  );
  getIt.registerLazySingleton<UserAuthenticationServices>(
    () => UserAuthenticationServices(),
  );
  getIt.registerLazySingleton<JwtTokenStorageService>(
    () => JwtTokenStorageService(),
  );
  getIt.registerLazySingleton<EmbeddingsLocalStorageService>(
    () => EmbeddingsLocalStorageService(),
  );
  getIt.registerLazySingleton<ContentsLocalStorageService>(
    () => ContentsLocalStorageService(),
  );
  getIt
      .registerSingletonWithDependencies<ContentLibraryUserPrefsLocalDbService>(
        () => ContentLibraryUserPrefsLocalDbService(prefs: getIt()),
        dependsOn: [SharedPreferences],
      );
  getIt.registerLazySingleton<GetContentLayoutPref>(
    () => GetContentLayoutPref(contentLibraryUserPrefsLocalDbService: getIt()),
  );
  getIt.registerLazySingleton<SetContentsLayoutPref>(
    () => SetContentsLayoutPref(contentLibraryUserPrefsLocalDbService: getIt()),
  );
  getIt.registerLazySingleton<IsPinnedContentExists>(
    () => IsPinnedContentExists(contentsLocalStorageService: getIt()),
  );
  getIt.registerLazySingleton<ReadAccessToken>(
    () => ReadAccessToken(jwtTokenStorageService: getIt()),
  );
  getIt.registerLazySingleton<ReadRefreshToken>(
    () => ReadRefreshToken(jwtTokenStorageService: getIt()),
  );

  getIt.registerFactory<UserAuthBloc>(
    () => UserAuthBloc(
      userAuthenticationServices: getIt(),
      jwtTokenStorageService: getIt(),
    ),
  );
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
  getIt.registerFactory<RecentItemsCubit>(
    () => RecentItemsCubit(
      contentsLocalStorageService: getIt(),
      recentContentsLocalDbService: getIt(),
    ),
  );
  getIt.registerFactory<PinItemsCubit>(
    () => PinItemsCubit(contentsLocalStorageService: getIt()),
  );
  getIt.registerFactory<FilterAndSortPreferencesCubit>(
    () => FilterAndSortPreferencesCubit(
      filterAndSortPrefsLocaldbService: getIt(),
    ),
  );
}
