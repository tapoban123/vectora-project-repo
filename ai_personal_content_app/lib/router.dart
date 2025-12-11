import 'package:ai_personal_content_app/features/auth/screens/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class RouteNames {
  RouteNames._();

  static const String home = "/";
  static const String onboarding = "/onboarding";
}

final router = GoRouter(
  initialLocation: RouteNames.onboarding,
  routes: [
    GoRoute(
      path: RouteNames.onboarding,
      builder: (context, state) => OnboardingScreen(),
    ),
  ],
);
