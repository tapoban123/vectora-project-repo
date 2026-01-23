import 'package:ai_personal_content_app/features/search/screens/content_library_screen.dart';
import 'package:ai_personal_content_app/features/search/services/content_library_user_prefs_localdb_service.dart';

class GetContentLayoutPref {
  final ContentLibraryUserPrefsLocalDbService
  _contentLibraryUserPrefsLocalDbService;

  GetContentLayoutPref({
    required ContentLibraryUserPrefsLocalDbService
    contentLibraryUserPrefsLocalDbService,
  }) : _contentLibraryUserPrefsLocalDbService =
           contentLibraryUserPrefsLocalDbService;

  ContentLayoutType call() {
    return _contentLibraryUserPrefsLocalDbService.getContentsLayout();
  }
}
