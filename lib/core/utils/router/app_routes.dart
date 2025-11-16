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

abstract class AppRouter {
  static const kOnboardingView = '/onboardingView';
  static const kGetStartedView = '/getStartedView';
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kVerificationCodeView = '/verificationCodeView';
  static const kCreateNewPasswordView = '/createNewPasswordView';
  static const kHomeView = '/homeView';

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
      GoRoute(
        path: '/forgetPasswordView',
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: '/verificationCodeView',
        builder: (context, state) => const VerificationCodeView(),
      ),
      GoRoute(
        path: '/createNewPasswordView',
        builder: (context, state) => const CreateNewPasswordView(),
      ),
      GoRoute(path: '/homeView', builder: (context, state) => const HomeView()),
    ],
  );
}
