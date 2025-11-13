import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(isLeading: true, title: 'Login'),
      body: Padding(
        padding: AppDimensions.pagePadding,
        child: Column(
          children: [
            Center(
              child: Text(
                'Hi Welcome back, you’ve been missed',
                style: AppStyles.semiBold16(),
              ),
            ),
            const SizedBox(height: AppDimensions.medium),
          ],
        ),
      ),
    );
  }
}
