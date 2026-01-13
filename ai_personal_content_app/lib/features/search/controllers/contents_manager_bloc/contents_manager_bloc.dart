import 'package:ai_personal_content_app/core/common/services/embeddings_storage_service.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_events.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_states.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentsManagerBloc
    extends Bloc<ContentsManagerEvents, ContentsManagerStates> {
  final ContentsLocalStorageService _contentsLocalStorageService;
  final EmbeddingsLocalStorageService _embeddingsLocalStorageService;

  ContentsManagerBloc({
    required ContentsLocalStorageService contentsLocalStorageService,
    required EmbeddingsLocalStorageService embeddingsLocalStorageService,
  }) : _contentsLocalStorageService = contentsLocalStorageService,
       _embeddingsLocalStorageService = embeddingsLocalStorageService,
       super(ContentsManagerStates.initial()) {
    on<FetchAllContents>(_fetchAllContents);
    on<RemoveContent>(_removeContent);
    on<RemoveMultipleContent>(_removeMultipleContent);
  }

  List<ContentsEntity> _contents = [];

  void _fetchAllContents(FetchAllContents event, Emitter emit) {
    final contents = _contentsLocalStorageService.fetchAllContents();
    _contents = contents;

    emit(
      ContentsManagerStates.allContents(contents: List.unmodifiable(_contents)),
    );
  }

  void _removeContent(RemoveContent event, Emitter emit) async {
    _contents.removeWhere((element) => element.id == event.objectBoxId);
    _contentsLocalStorageService.removeContent(event.objectBoxId);
    _embeddingsLocalStorageService.deleteEmbedding(event.cid);
    emit(
      ContentsManagerStates.allContents(contents: List.unmodifiable(_contents)),
    );
  }

  void _removeMultipleContent(
    RemoveMultipleContent event,
    Emitter emit,
  ) async {}
}
