import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_divider.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_email_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_login_with_accouts.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_password_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: CustomAppBar(isLeading: true, title: 'Login'),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppDimensions.pagePadding,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Hi Welcome back, you’ve been missed',
                    style: AppStyles.semiBold(fontSize: 16),
                  ),
                ),
                const SizedBox(height: AppDimensions.medium),
                const CustomEmailTextField(),
                const SizedBox(height: AppDimensions.medium),
                CustomPasswordTextField(),
                const SizedBox(height: AppDimensions.small),
                GestureDetector(
                  onTap: () {
                    context.push(AppRouter.kForgetPasswordView);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: AppStyles.semiBold(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 34),

                AppButton(onTap: () {}, text: 'Login'),
                const SizedBox(height: AppDimensions.medium),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: AppStyles.reguler(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: AppStyles.reguler(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(AppRouter.kSignupView);
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.medium),
                CustomDivider(),
                SizedBox(height: 30),

                CustomLoginWithAccouts(
                  image: Assets.imagesGoogle,
                  text: 'Sign in with google',
                ),
                SizedBox(height: AppDimensions.medium),
                CustomLoginWithAccouts(
                  image: Assets.imagesAppleLogo,
                  text: 'Sign in with Apple',
                ),
                SizedBox(height: AppDimensions.medium),

                CustomLoginWithAccouts(
                  image: Assets.imagesFacebook,
                  text: 'Sign in with Facebook',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
