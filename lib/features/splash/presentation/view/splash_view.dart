import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/features/splash/presentation/widgets/splash_content.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool showSecond = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => showSecond = true);
      Future.delayed(const Duration(seconds: 1), () {
        // ignore: use_build_context_synchronously
        if (context.mounted) context.go(AppRouter.kOnboardingView);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: showSecond ? Colors.black : Colors.white,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        child: showSecond ? _SecondSplash() : _FirstSplash(),
      ),
    );
  }
}

class _FirstSplash extends StatelessWidget {
  const _FirstSplash();

  @override
  Widget build(BuildContext context) {
    return SplashContent(color: AppColors.primaryColor);
  }
}

class _SecondSplash extends StatelessWidget {
  const _SecondSplash();

  @override
  Widget build(BuildContext context) {
    return SplashContent(color: AppColors.secondSplashColor);
  }
}
