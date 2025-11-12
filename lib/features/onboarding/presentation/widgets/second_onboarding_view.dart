import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/features/onboarding/presentation/widgets/onboarding_view_content.dart';

class SecondOnboardingView extends StatelessWidget {
  const SecondOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingViewContent(
      headText: 'Explore & Shop',
      descText:
          'Discover a wide range of fashion categories,browse new arrivals and shop your favourites',
      image: Assets.imagesSecondOnboardingBackground,
    );
  }
}
