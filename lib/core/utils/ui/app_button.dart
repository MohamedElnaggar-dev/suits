// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
  });
  final void Function()? onTap;
  final bool isLoading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(32),
        child: Container(
          height: 56,

          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.medium,
            horizontal: AppPadding.small,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              colors: onTap == null
                  ? AppColors.secondaryGradientColors
                  : AppColors.primaryGradientColors,
            ),
          ),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(text, style: AppStyles.semiBold16(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
