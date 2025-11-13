import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      Assets.imagesLeftCircle,
                      width: 200,
                      height: 225,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 100,
                    child: Image.asset(
                      Assets.imagesRightCircle,
                      width: 150,
                      height: 225,
                    ),
                  ),
                  Positioned(
                    top: 33,
                    left: 16,
                    child: SizedBox(
                      height: 370,
                      width: 150,
                      child: Image.asset(Assets.imagesFirstGetStartedImage),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 16,
                    child: SizedBox(
                      height: 214,
                      width: 150,
                      child: Image.asset(Assets.imagesSecondGetStartedImage),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    right: 16,
                    child: SizedBox(
                      height: 133,
                      width: 141,
                      child: Image.asset(Assets.imagesThirdGetStartedImage),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppDimensions.pagePadding,
              child: Column(
                children: [
                  _headText(),
                  SizedBox(height: AppDimensions.xxxLarge),
                  Text(
                    'Everything you need in the world\n      of fashion, old and new',
                    style: AppStyles.semiBold(
                      fontSize: 16,
                      color: Color(0xff727272),
                    ),
                  ),
                  SizedBox(height: 61),
                  AppButton(
                    text: 'Get Started',
                    onTap: () {
                      context.push(AppRouter.kLoginView);
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText _headText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppStyles.bold(fontSize: 20),
        children: [
          TextSpan(text: 'The '),
          TextSpan(
            text: 'Suits App ',
            style: TextStyle(color: AppColors.primaryColor),
          ),
          const TextSpan(text: 'that\nMakes Your Look Your Best'),
        ],
      ),
    );
  }
}
