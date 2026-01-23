import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';

class IsPinnedContentExists {
  final ContentsLocalStorageService _contentsLocalStorageService;

  IsPinnedContentExists({
    required ContentsLocalStorageService contentsLocalStorageService,
  }) : _contentsLocalStorageService = contentsLocalStorageService;

  bool call() {
    return _contentsLocalStorageService.isAnyContentPinned();
  }
}
