import 'dart:developer';

import 'package:ai_personal_content_app/core/common/services/embedding_generation_service.dart';
import 'package:ai_personal_content_app/core/common/services/embeddings_storage_service.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_events.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_states.dart';
import 'package:ai_personal_content_app/features/search/models/contents_with_scrore_model.dart';
import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchContentsBloc
    extends Bloc<SearchContentsEvents, SearchContentsStates> {
  final EmbeddingGenerationService _embeddingGenerationService;
  final EmbeddingsLocalStorageService _embeddingsLocalStorageService;
  final ContentsLocalStorageService _contentsLocalStorageService;

  SearchContentsBloc({
    required EmbeddingGenerationService embeddingGenerationService,
    required EmbeddingsLocalStorageService embeddingsLocalStorageService,
    required ContentsLocalStorageService contentsLocalStorageService,
  }) : _embeddingGenerationService = embeddingGenerationService,
       _embeddingsLocalStorageService = embeddingsLocalStorageService,
       _contentsLocalStorageService = contentsLocalStorageService,
       super(SearchContentsStates.initial()) {
    on<GenerateQueryEmbeddings>(_generateQueryEmbeddings);
  }

  void _generateQueryEmbeddings(
    GenerateQueryEmbeddings event,
    Emitter emit,
  ) async {
    emit(SearchContentsStates.loading());
    final response = await _embeddingGenerationService.generateTextEmbeddings(
      text: event.query,
    );

    response.fold(
      (l) => emit(
        SearchContentsStates.error(
          message: l.message,
          statusCode: l.statusCode,
        ),
      ),
      (r) {
        try {
          final matchedEmbeddings = _embeddingsLocalStorageService
              .fetchNearestEmbeddings(r.embeddings);

          final matchedImageEmbeddings = matchedEmbeddings.images;
          final matchedDocumentsEmbeddings = matchedEmbeddings.documents;
          final matchedNotesEmbeddings = matchedEmbeddings.notes;

          final matchedImages = _contentsLocalStorageService.fetchContentsByCid(
            matchedImageEmbeddings.map((e) => e.cid).toList(),
          );
          final matchedDocuments = _contentsLocalStorageService
              .fetchContentsByCid(
                matchedDocumentsEmbeddings.map((e) => e.cid).toList(),
              );
          final matchedNotes = _contentsLocalStorageService.fetchContentsByCid(
            matchedNotesEmbeddings.map((e) => e.cid).toList(),
          );

          final List<ContentWithScroreModel> imagesWithScore =
              matchedImageEmbeddings.isNotEmpty
              ? matchedImages
                    .map(
                      (e) => ContentWithScroreModel(
                        distance: matchedImageEmbeddings
                            .firstWhere((element) => e.contentId == element.cid)
                            .distance,
                        content: e,
                      ),
                    )
                    .toList()
              : [];
          final List<ContentWithScroreModel> documentsWithScore =
              matchedDocumentsEmbeddings.isNotEmpty
              ? matchedDocuments
                    .map(
                      (e) => ContentWithScroreModel(
                        distance: matchedDocumentsEmbeddings
                            .firstWhere((element) => e.contentId == element.cid)
                            .distance,
                        content: e,
                      ),
                    )
                    .toList()
              : [];
          final List<ContentWithScroreModel> notesWithScore =
              matchedNotesEmbeddings.isNotEmpty
              ? matchedNotes
                    .map(
                      (e) => ContentWithScroreModel(
                        distance: matchedNotesEmbeddings
                            .firstWhere((element) => e.contentId == element.cid)
                            .distance,
                        content: e,
                      ),
                    )
                    .toList()
              : [];
          emit(
            SearchContentsStates.embeddingsGenerated(
              documents: documentsWithScore,
              images: imagesWithScore,
              notes: notesWithScore,
            ),
          );
        } catch (e, stk) {
          log("[GENERATE QUERY EMBEDDINGS BLOC ERROR] $e\n$stk");
          emit(SearchContentsStates.error(message: e.toString()));
        }
      },
    );
  }
}
