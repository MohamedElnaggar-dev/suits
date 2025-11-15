import 'package:flutter/material.dart';

import 'package:suits_app/core/utils/constants/app_assets.dart';

import 'package:suits_app/core/utils/ui/custom_text_field.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    this.controller,
    required this.hintText,
  });
  final TextEditingController? controller;
  final String hintText;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: widget.hintText,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Image.asset(Assets.imagesPassword, width: 24, height: 24),
      ),
      suffixIcon: GestureDetector(
        onTap: () => setState(() => isObscure = !isObscure),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Image.asset(
            Assets.imagesHidePassword,
            width: 24,
            height: 24,
            color: isObscure == false ? Colors.black : null,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Fill The Password';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: isObscure,
    );
  }
}
