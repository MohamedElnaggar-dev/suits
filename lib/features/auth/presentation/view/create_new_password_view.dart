import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_password_text_field.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: CustomAppBar(isLeading: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppDimensions.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create New Password',
                  style: AppStyles.bold(fontSize: 24),
                ),
                const SizedBox(height: AppDimensions.medium),
                Text(
                  'ECreate your new password to login',
                  style: AppStyles.reguler(
                    fontSize: 16,
                    color: AppColors.hintTextColor,
                  ),
                ),
                const SizedBox(height: AppDimensions.medium),
                const CustomPasswordTextField(
                  hintText: 'Enter the New Password',
                ),
                const SizedBox(height: AppDimensions.medium),
                const CustomPasswordTextField(
                  hintText: 'Enter the New Password Again',
                ),
                const SizedBox(height: 34),
                AppButton(
                  onTap: () {
                    context.push(AppRouter.kVerificationCodeView);
                  },
                  text: 'Create Password',
                ),
                const SizedBox(height: AppDimensions.medium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
