import 'dart:developer';

import 'package:ai_personal_content_app/core/common/models/nearest_embedding_contents_model.dart';
import 'package:ai_personal_content_app/core/common/services/embedding_generation_service.dart';
import 'package:ai_personal_content_app/core/common/services/embeddings_storage_service.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_events.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_states.dart';
import 'package:ai_personal_content_app/features/search/models/contents_with_scrore_model.dart';
import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';
import 'package:flutter/foundation.dart';
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

    await response.fold(
      (l) async => emit(
        SearchContentsStates.error(
          message: l.message,
          statusCode: l.statusCode,
        ),
      ),
      (r) async {
        try {
          final matchedEmbeddings = _embeddingsLocalStorageService
              .fetchNearestEmbeddings(r.embeddings);
          final organisedContents = _organiseAllMatchedContents(
            matchedEmbeddings,
          );
          // final organisedContents = await compute(
          //   _organiseAllMatchedContents,
          //   matchedEmbeddings,
          // );

          emit(
            SearchContentsStates.embeddingsGenerated(
              documents: organisedContents.documents,
              images: organisedContents.images,
              notes: organisedContents.notes,
            ),
          );
        } catch (e, stk) {
          log("[GENERATE QUERY EMBEDDINGS BLOC ERROR] $e\n$stk");
          emit(SearchContentsStates.error(message: e.toString()));
        }
      },
    );
  }

  ({
    List<ContentWithScroreModel> images,
    List<ContentWithScroreModel> documents,
    List<ContentWithScroreModel> notes,
  })
  _organiseAllMatchedContents(NearestContentsByTypeModel matchedEmbeddings) {
    final matchedImageEmbeddings = matchedEmbeddings.images;
    final matchedDocumentsEmbeddings = matchedEmbeddings.documents;
    final matchedNotesEmbeddings = matchedEmbeddings.notes;

    final matchedImages = _contentsLocalStorageService.fetchContentsByCid(
      matchedImageEmbeddings.map((e) => e.cid).toList(),
    );
    final matchedDocuments = _contentsLocalStorageService.fetchContentsByCid(
      matchedDocumentsEmbeddings.map((e) => e.cid).toList(),
    );
    final matchedNotes = _contentsLocalStorageService.fetchContentsByCid(
      matchedNotesEmbeddings.map((e) => e.cid).toList(),
    );

    final List<ContentWithScroreModel> imagesWithDistance =
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
    final List<ContentWithScroreModel> documentsWithDistance =
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
    final List<ContentWithScroreModel> notesWithDistance =
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

    documentsWithDistance.sort((a, b) => a.distance.compareTo(b.distance));
    imagesWithDistance.sort((a, b) => a.distance.compareTo(b.distance));
    notesWithDistance.sort((a, b) => a.distance.compareTo(b.distance));

    return (
      images: imagesWithDistance,
      documents: documentsWithDistance,
      notes: notesWithDistance,
    );
  }
}
