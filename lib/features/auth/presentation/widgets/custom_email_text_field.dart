import 'package:flutter/material.dart';

import 'package:suits_app/core/utils/constants/app_assets.dart';

import 'package:suits_app/core/utils/ui/custom_text_field.dart';

class CustomEmailTextField extends StatelessWidget {
  const CustomEmailTextField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'Enter your Email',
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Image.asset(Assets.imagesEmail, width: 24, height: 24),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Fill The Email';
        }

        if (!value.endsWith("@gmail.com")) {
          return 'Write Email In Right Format';
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
    );
  }
}
