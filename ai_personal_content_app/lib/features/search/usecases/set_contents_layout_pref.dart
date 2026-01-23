import 'package:ai_personal_content_app/features/search/screens/content_library_screen.dart';
import 'package:ai_personal_content_app/features/search/services/content_library_user_prefs_localdb_service.dart';

class SetContentsLayoutPref {
  final ContentLibraryUserPrefsLocalDbService
  _contentLibraryUserPrefsLocalDbService;

  SetContentsLayoutPref({
    required ContentLibraryUserPrefsLocalDbService
    contentLibraryUserPrefsLocalDbService,
  }) : _contentLibraryUserPrefsLocalDbService =
           contentLibraryUserPrefsLocalDbService;

  void call(ContentLayoutType layout) {
    return _contentLibraryUserPrefsLocalDbService.setContentsLayout(layout);
  }
}
