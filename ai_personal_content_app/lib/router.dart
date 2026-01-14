import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/auth/screens/onboarding_screen.dart';
import 'package:ai_personal_content_app/features/home/screens/add_new_content_screen.dart';
import 'package:ai_personal_content_app/features/home/screens/home_screen.dart';
import 'package:ai_personal_content_app/features/home/screens/notes_edit_or_create_screen.dart';
import 'package:ai_personal_content_app/features/items/screens/view_item_screen.dart';
import 'package:ai_personal_content_app/features/profile-and-settings/screens/user_profile_screen.dart';
import 'package:ai_personal_content_app/features/search/screens/content_library_screen.dart';
import 'package:ai_personal_content_app/features/search/screens/search_contents_screen.dart';
import 'package:go_router/go_router.dart';

class RouteNames {
  RouteNames._();

  static const String home = "/";
  static const String onboarding = "/onboarding";
  static const String viewItemOptions = "/view-item";
  static const String userProfile = "/user-profile";
  static const String addNewContent = "/add-new-content";
  static const String createOrPasteNote = "/create-or-paste-note";
  static const String searchContent = "/search-content";
  static const String contentLibrary = "/content-library";
  static const String viewPhoto = "/view-photo";
}

final router = GoRouter(
  initialLocation: RouteNames.home,
  routes: [
    GoRoute(
      path: RouteNames.onboarding,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(path: RouteNames.home, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: RouteNames.viewItemOptions,
      builder: (context, state) {
        final content = state.extra as Map<String, dynamic>?;
        return ViewItemScreen(content: content?["content"]);
      },
    ),
    GoRoute(
      path: RouteNames.userProfile,
      builder: (context, state) => UserProfileScreen(),
    ),
    GoRoute(
      path: RouteNames.addNewContent,
      builder: (context, state) => AddNewContentScreen(),
    ),
    GoRoute(
      path: RouteNames.createOrPasteNote,
      builder: (context, state) => NotesEditOrCreateScreen(),
    ),
    GoRoute(
      path: RouteNames.searchContent,
      builder: (context, state) => SearchContentsScreen(),
    ),
    GoRoute(
      path: RouteNames.contentLibrary,
      builder: (context, state) => ContentLibraryScreen(),
    ),
    GoRoute(
      path: RouteNames.viewPhoto,
      builder: (context, state) {
        final data = state.extra as Map;
        return ViewPhotoScreen(path: data["path"], name: data["name"]);
      },
    ),
  ],
);
