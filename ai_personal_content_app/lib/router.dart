import 'package:ai_personal_content_app/features/auth/screens/onboarding_screen.dart';
import 'package:ai_personal_content_app/features/home/screens/home_screen.dart';
import 'package:ai_personal_content_app/features/items/screens/view_item_screen.dart';
import 'package:ai_personal_content_app/features/profile-and-settings/screens/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

class RouteNames {
  RouteNames._();

  static const String home = "/";
  static const String onboarding = "/onboarding";
  static const String viewItemOptions = "/view-item";
  static const String userProfile = "/user-profile";
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
  ],
);
