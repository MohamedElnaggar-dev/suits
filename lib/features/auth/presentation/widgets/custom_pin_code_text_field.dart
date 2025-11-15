import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onCompleted;

  const CustomPinCodeTextField({super.key, this.onChanged, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      keyboardType: TextInputType.number,
      autoFocus: true,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 70,
        fieldWidth: 70,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        inactiveColor: Colors.white,
      ),
      enableActiveFill: true,
      onChanged: (value) {
        if (kDebugMode) {
          print(value);
        }
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      onCompleted: (value) {
        if (kDebugMode) {
          print("OTP Entered: $value");
        }
        if (onCompleted != null) {
          onCompleted!(value);
        }
      },
    );
  }
}
