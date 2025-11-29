// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class CustomLoginWithAccouts extends StatelessWidget {
  const CustomLoginWithAccouts({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
    this.isLoading = false,
  });
  final String text;
  final String image;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimensions.buttonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.transparent,
          border: Border.all(color: AppColors.borderColor, width: 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Image.asset(image, width: 24, height: 24),
            ),
            const SizedBox(width: 24),
            Center(
              child: isLoading
                  ? const CupertinoActivityIndicator(color: Colors.white)
                  : Text(
                      text,
                      style: AppStyles.semiBold(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
