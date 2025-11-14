import 'package:go_router/go_router.dart';
import 'package:suits_app/features/auth/presentation/view/login_view.dart';
import 'package:suits_app/features/auth/presentation/view/signup_view.dart';
import 'package:suits_app/features/get_started/presentation/view/get_started_view.dart';
import 'package:suits_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:suits_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kOnboardingView = '/onboardingView';
  static const kGetStartedView = '/getStartedView';
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: '/onboardingView',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: '/getStartedView',
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(
        path: '/loginView',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/signupView',
        builder: (context, state) => const SignupView(),
      ),
    ],
  );
}
