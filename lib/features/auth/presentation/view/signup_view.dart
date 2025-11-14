import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_email_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_name_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_password_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/terms_and_conditions.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

bool change = false;

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(isLeading: true, title: 'Sign Up'),
      body: Padding(
        padding: AppDimensions.pagePadding,
        child: Column(
          children: [
            CustomNameTextField(),
            const SizedBox(height: AppDimensions.medium),
            const CustomEmailTextField(),
            const SizedBox(height: AppDimensions.medium),
            CustomPasswordTextField(),
            const SizedBox(height: AppDimensions.small),
            TermsAndConditions(
              changed: (value) {
                value = change;
              },
            ),
            const SizedBox(height: 34),

            AppButton(
              onTap: () {
                context.go(AppRouter.kLoginView);
              },
              text: 'Register',
            ),
            const SizedBox(height: AppDimensions.medium),
          ],
        ),
      ),
    );
  }
}
