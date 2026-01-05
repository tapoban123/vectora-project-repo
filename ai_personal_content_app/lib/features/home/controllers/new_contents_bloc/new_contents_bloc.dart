import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/core/common/services/embedding_generation_service.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_events.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_states.dart';
import 'package:ai_personal_content_app/features/home/models/preview_file_model.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';

class NewContentsBloc extends Bloc<NewContentsEvents, NewContentsStates> {
  final EmbeddingGenerationService _embeddingGenerationService;

  NewContentsBloc({
    required EmbeddingGenerationService embeddingGenerationService,
  }) : _embeddingGenerationService = embeddingGenerationService,
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
    for (final content in _newData) {
      final fileData = await content.file.readAsString();
      if (content.fileType == ContentFileType.NOTE) {
        final doc = Document.fromJson(jsonDecode(fileData));
        final String plainText = doc.toPlainText();
        final embeddings = await _embeddingGenerationService
            .generateTextEmbeddings(
              text: plainText,
              onReceiveProgress: (count, total) {
                emit(
                  NewContentsStates.loading(
                    content: content.copyWith(loadingProgress: count / total),
                  ),
                );
              },
            );

        embeddings.fold(
          (l) => emit(NewContentsStates.error(message: l.message)),
          (r) => log(r.toString()),
        );
      }
    }
  }

  void _clear(ClearAllAddedContentsEvent event, Emitter emit) {
    _newData.clear();
    emit(NewContentsStates.newContents(contents: List.unmodifiable(_newData)));
  }
}
