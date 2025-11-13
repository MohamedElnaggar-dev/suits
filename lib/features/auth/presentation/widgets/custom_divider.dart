import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(thickness: 0.5),
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'OR',
            style: AppStyles.reguler(
              fontSize: 20,
              color: AppColors.hintTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
