import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_email_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: CustomAppBar(isLeading: true, title: 'Sign Up'),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppDimensions.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Your Password?',
                  style: AppStyles.bold(fontSize: 24),
                ),
                const SizedBox(height: AppDimensions.medium),
                Text(
                  'Enter your email address and we’ll send you confirmation code',
                  style: AppStyles.reguler(
                    fontSize: 16,
                    color: AppColors.hintTextColor,
                  ),
                ),
                const SizedBox(height: AppDimensions.medium),
                const CustomEmailTextField(),
                const SizedBox(height: AppDimensions.medium),
                const SizedBox(height: 34),
                AppButton(onTap: () {}, text: 'Reset Password'),
                const SizedBox(height: AppDimensions.medium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
