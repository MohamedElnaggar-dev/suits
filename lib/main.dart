import 'package:flutter/material.dart';
import 'package:suits_app/features/onboarding/presentation/view/onboarding_view.dart';

void main() {
  runApp(const SuitsApp());
}

class SuitsApp extends StatelessWidget {
  const SuitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OnboardingView());
  }
}
