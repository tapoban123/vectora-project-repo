import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_personal_content_app/core/api/exceptions.dart';
import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/services/embedding_generation_service.dart';
import 'package:ai_personal_content_app/core/common/services/embeddings_storage_service.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_events.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_states.dart';
import 'package:ai_personal_content_app/features/home/models/content_embedding_response_model.dart';
import 'package:ai_personal_content_app/features/home/models/preview_file_model.dart';
import 'package:ai_personal_content_app/features/search/entities/content_embeddings_entity.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

class NewContentsBloc extends Bloc<NewContentsEvents, NewContentsStates> {
  final EmbeddingGenerationService _embeddingGenerationService;
  final EmbeddingsLocalStorageService _embeddingsLocalStorageService;
  final ContentsLocalStorageService _contentsLocalStorageService;

  NewContentsBloc({
    required EmbeddingGenerationService embeddingGenerationService,
    required EmbeddingsLocalStorageService embeddingsLocalStorageService,
    required ContentsLocalStorageService contentsLocalStorageService,
  }) : _embeddingGenerationService = embeddingGenerationService,
       _embeddingsLocalStorageService = embeddingsLocalStorageService,
       _contentsLocalStorageService = contentsLocalStorageService,
       super(NewContentsStates.initial()) {
    on<CaptureImageEvent>(_captureImage);
    on<ScanDocumentsEvent>(_scanDocuments);
    on<UploadFilesEvent>(_uploadFiles);
    on<CreateOrPasteNotesEvent>(_createOrPasteNotes);
    on<RemoveContentEvent>(_removeContent);
    on<GenerateEmbeddingsForAllEvent>(_generateEmbeddings);
    on<ClearAllAddedContentsEvent>(_clear);
  }

  final List<PreviewFileModel> _newData = [];

  void _captureImage(CaptureImageEvent event, Emitter emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final imageFile = File(image.path);
      _newData.add(PreviewFileModel.fromFile(file: imageFile));
      emit(
        NewContentsStates.newContents(contents: List.unmodifiable(_newData)),
      );
    }
  }

  void _scanDocuments(ScanDocumentsEvent event, Emitter emit) async {
    final imagesPath = await CunningDocumentScanner.getPictures(
      isGalleryImportAllowed: true,
    );

    if (imagesPath != null) {
      final files = imagesPath
          .map((path) => PreviewFileModel.fromFile(file: File(path)))
          .toList();
      _newData.addAll(files);
      emit(
        NewContentsStates.newContents(contents: List.unmodifiable(_newData)),
      );
    }
  }

  void _uploadFiles(UploadFilesEvent event, Emitter emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ["pdf", "svg", "jpg", "jpeg"],
    );

    if (result != null) {
      List<PreviewFileModel> files = result.paths
          .map((path) => PreviewFileModel.fromFile(file: File(path!)))
          .toList();
      _newData.addAll(files);
      emit(
        NewContentsStates.newContents(contents: List.unmodifiable(_newData)),
      );
    }
  }

  void _createOrPasteNotes(CreateOrPasteNotesEvent event, Emitter emit) async {
    _newData.add(PreviewFileModel.fromFile(file: event.notesJson));
    emit(NewContentsStates.newContents(contents: List.unmodifiable(_newData)));
  }

  void _removeContent(RemoveContentEvent event, Emitter emit) {
    _newData.removeAt(event.index);
    emit(NewContentsStates.newContents(contents: List.unmodifiable(_newData)));
  }

  void _generateEmbeddings(
    GenerateEmbeddingsForAllEvent event,
    Emitter emit,
  ) async {
    try {
      final embeddingFutures = _newData.map(
        (content) =>
            _generateEachContentEmbedding(content: content, emit: emit),
      );

      final List<ContentEmbeddingResponseModel?> embeddings = await Future.wait(
        embeddingFutures,
      );

      _embeddingsLocalStorageService.insertEmbeddings(
        embeddings.nonNulls.map((e) {
          return ContentEmbeddingsEntity(
            contentId: e.cid!,
            contentVectors: e.embeddings,
          );
        }).toList(),
      );

      final List<ContentsEntity> contents = [];
      for (final embedding in embeddings.nonNulls.toList()) {
        final file = _newData.singleWhere(
          (element) => element.cid == embedding.cid,
        );
        final path = await _contentsLocalStorageService.storeFileToAppDirectory(
          file.file,
          file.fileType,
        );
        final content = ContentsEntity(
          contentId: embedding.cid!,
          path: path,
          contentName: file.name,
          contentSizeInBytes: file.sizeInBytes,
          extension: file.extension,
          type: file.fileType.name,
          createdAt: DateTime.now(),
          updatedAt: null,
        );

        contents.add(content);
      }

      _contentsLocalStorageService.insertContents(contents);
      emit(NewContentsStates.success());
    } catch (e, stk) {
      log("[EMBEDDING GENERATION BLOC ERROR] $e\n$stk");
      emit(NewContentsStates.error(message: e.toString()));
      emit(NewContentsStates.initial());
    }
  }

  Future<ContentEmbeddingResponseModel?> _generateEachContentEmbedding({
    required PreviewFileModel content,
    required Emitter emit,
  }) async {
    ContentEmbeddingResponseModel? embeddings;
    late Either<ApiException, ContentEmbeddingResponseModel> embeddingsResp;

    if (content.fileType == ContentFileType.NOTE) {
      final fileData = await content.file.readAsString();
      final doc = Document.fromJson(jsonDecode(fileData));
      final String plainText = doc.toPlainText();
      embeddingsResp = await _embeddingGenerationService.generateTextEmbeddings(
        cid: content.cid,
        text: plainText,
        onReceiveProgress: (count, total) {
          _onReceiveProgress(count, total, emit, content);
        },
      );
    } else if (content.fileType == ContentFileType.IMAGE) {
      embeddingsResp = await _embeddingGenerationService
          .generateImageEmbeddings(
            cid: content.cid,
            image: content.file,
            onReceiveProgress: (count, total) {
              _onReceiveProgress(count, total, emit, content);
            },
          );
    }

    embeddingsResp.fold(
      (l) => emit(NewContentsStates.error(message: l.message)),
      (r) => embeddings = r,
    );
    return embeddings;
  }

  void _onReceiveProgress(
    int count,
    int total,
    Emitter emit,
    PreviewFileModel content,
  ) {
    emit(
      NewContentsStates.loading(
        content: content.copyWith(loadingProgress: count / total),
      ),
    );
  }

  void _clear(ClearAllAddedContentsEvent event, Emitter emit) {
    _newData.clear();
    emit(NewContentsStates.newContents(contents: List.unmodifiable(_newData)));
  }
}
