import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/features/onboarding/presentation/widgets/onboarding_view_content.dart';

class FirstOnboardingView extends StatelessWidget {
  const FirstOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingViewContent(
      headText: 'Welcome To Fashion',
      descText:
          'Discover the latest trends and exclusive styles from our top designers',
      image: Assets.imagesFirstOnboardingBackground,
    );
  }
}
