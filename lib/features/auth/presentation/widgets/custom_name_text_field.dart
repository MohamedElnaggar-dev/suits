import 'package:flutter/material.dart';

import 'package:suits_app/core/utils/constants/app_assets.dart';

import 'package:suits_app/core/utils/ui/custom_text_field.dart';

class CustomNameTextField extends StatelessWidget {
  const CustomNameTextField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'Enter your Email',
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Image.asset(Assets.imagesUserIcon, width: 24, height: 24),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Fill The Name';
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
    );
  }
}
