import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/features/onboarding/presentation/widgets/first_onboarding_view.dart';
import 'package:suits_app/features/onboarding/presentation/widgets/routaion_circle.dart';
import 'package:suits_app/features/onboarding/presentation/widgets/second_onboarding_view.dart';
import 'package:suits_app/features/onboarding/presentation/widgets/skip_button.dart';
import 'package:suits_app/features/onboarding/presentation/widgets/third_onboarding_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            controller: controller,
            children: const [
              FirstOnboardingView(),
              SecondOnboardingView(),
              ThirdOnboardingView(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.9),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ColorTransitionEffect(
                dotColor: Colors.white,
                activeDotColor: AppColors.primaryColor,
              ),
            ),
          ),
          if (currentIndex != 2)
            GestureDetector(
              onTap: () {
                context.push(AppRouter.kGetStartedView);
              },
              child: Container(
                alignment: const Alignment(0.9, -0.87),
                child: const SkipButton(),
              ),
            ),
          if (currentIndex != 0)
            GestureDetector(
              onTap: () {
                controller.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
              child: Container(
                alignment: const Alignment(-0.92, 0.92),
                child: const RoutaionCircle(
                  circleColor: Colors.transparent,
                  iconColor: AppColors.primaryColor,
                  borderColor: Color(0xff4E6542),
                  icon: Icons.arrow_back_ios,
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              if (currentIndex != 2) {
                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              } else {
                context.push(AppRouter.kGetStartedView);
              }
            },
            child: Container(
              alignment: const Alignment(0.92, 0.92),
              child: const RoutaionCircle(
                circleColor: AppColors.primaryColor,
                iconColor: Colors.white,
                borderColor: Colors.transparent,
                icon: Icons.arrow_forward_ios_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
