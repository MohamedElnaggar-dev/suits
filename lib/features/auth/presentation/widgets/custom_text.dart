import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.blackText,
    required this.primaryColorText,
    this.onTap,
  });
  final String blackText, primaryColorText;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppStyles.reguler(color: Colors.black),
        children: [
          TextSpan(text: blackText),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: primaryColorText,
            style: const TextStyle(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
