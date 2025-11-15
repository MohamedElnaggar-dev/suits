import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_pin_code_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_text.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

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
                  'Enter Verification Code',
                  style: AppStyles.bold(fontSize: 24),
                ),
                const SizedBox(height: AppDimensions.medium),
                Text(
                  'Enter the verification code sent to your email address',
                  style: AppStyles.reguler(
                    fontSize: 16,
                    color: AppColors.hintTextColor,
                  ),
                ),
                const SizedBox(height: AppDimensions.medium),
                CustomPinCodeTextField(onChanged: (value) {}),
                const SizedBox(height: 34),
                AppButton(
                  onTap: () {
                    context.push(AppRouter.kCreateNewPasswordView);
                  },
                  text: 'Verify',
                ),
                const SizedBox(height: AppDimensions.medium),
                Center(
                  child: CustomText(
                    blackText: 'Didn’t receive the code?',
                    primaryColorText: ' Resend',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
