import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';

class IsContentPinned {
  final ContentsLocalStorageService _contentsLocalStorageService;

  IsContentPinned(ContentsLocalStorageService contentsLocalStorageService)
    : _contentsLocalStorageService = contentsLocalStorageService;

  bool call(int id) {
    return _contentsLocalStorageService.isContentPinned(id);
  }
}
