import 'package:ai_personal_content_app/features/auth/screens/onboarding_screen.dart';
import 'package:ai_personal_content_app/features/home/screens/add_new_content_screen.dart';
import 'package:ai_personal_content_app/features/home/screens/home_screen.dart';
import 'package:ai_personal_content_app/features/home/screens/notes_edit_or_create_screen.dart';
import 'package:ai_personal_content_app/features/items/screens/view_item_screen.dart';
import 'package:ai_personal_content_app/features/profile-and-settings/screens/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

class RouteNames {
  RouteNames._();

  static const String home = "/";
  static const String onboarding = "/onboarding";
  static const String viewItemOptions = "/view-item";
  static const String userProfile = "/user-profile";
  static const String addNewContent = "/add-new-content";
  static const String createOrPasteNote = "/create-or-paste-note";
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
      builder: (context, state) => ViewItemScreen(),
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
  ],
);
