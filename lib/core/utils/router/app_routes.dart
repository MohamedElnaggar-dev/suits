import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/features/auth/presentation/view/create_new_password_view.dart';
import 'package:suits_app/features/auth/presentation/view/forget_password_view.dart';
import 'package:suits_app/features/auth/presentation/view/login_view.dart';
import 'package:suits_app/features/auth/presentation/view/signup_view.dart';
import 'package:suits_app/features/auth/presentation/view/verification_code_view.dart';
import 'package:suits_app/features/get_started/presentation/view/get_started_view.dart';
import 'package:suits_app/features/home/presentation/view/home_view.dart';
import 'package:suits_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:suits_app/features/splash/presentation/view/splash_view.dart';
import 'package:suits_app/root.dart';

abstract class AppRouter {
  static const kOnboardingView = '/onboardingView';
  static const kGetStartedView = '/getStartedView';
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kVerificationCodeView = '/verificationCodeView';
  static const kCreateNewPasswordView = '/createNewPasswordView';
  static const kHomeView = '/homeView';
  static const kExploreView = '/exploreView';
  static const kProfileView = '/profileView';
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'shell',
  );
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kGetStartedView,
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kForgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kVerificationCodeView,
        builder: (context, state) => const VerificationCodeView(),
      ),
      GoRoute(
        path: kCreateNewPasswordView,
        builder: (context, state) => const CreateNewPasswordView(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Root(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: kHomeView,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kExploreView,
                builder: (context, state) =>
                    const Scaffold(body: Center(child: Text('Explore'))),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kProfileView,
                builder: (context, state) =>
                    const Scaffold(body: Center(child: Text('Profile'))),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
