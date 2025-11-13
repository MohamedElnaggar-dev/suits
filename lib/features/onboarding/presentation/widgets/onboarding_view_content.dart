import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class OnboardingViewContent extends StatelessWidget {
  const OnboardingViewContent({
    super.key,
    required this.headText,
    required this.descText,
    required this.image,
  });
  final String headText;
  final String descText;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 58),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(headText, style: AppStyles.bold36()),
            const SizedBox(height: 10),
            Text(descText, style: AppStyles.reguler(fontSize: 14)),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
