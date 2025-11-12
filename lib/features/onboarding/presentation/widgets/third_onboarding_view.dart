import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/features/onboarding/presentation/widgets/onboarding_view_content.dart';

class ThirdOnboardingView extends StatelessWidget {
  const ThirdOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingViewContent(
      headText: 'Hi,Shop Now',
      descText: '',
      image: Assets.imagesThirdOnboardingBackground,
    );
  }
}
