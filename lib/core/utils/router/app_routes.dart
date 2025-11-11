import 'package:go_router/go_router.dart';
import 'package:suits_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  // static const kSigninEmailView = '/signinEmailView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
    ],
  );
}
