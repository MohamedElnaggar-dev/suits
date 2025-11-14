import 'package:flutter/material.dart';

import 'package:suits_app/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_text.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.changed});
  final ValueChanged<bool> changed;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckBox(
          isCheck: isCheck,
          onChecked: (bool value) {
            isCheck = value;
            widget.changed(value);
            setState(() {});
          },
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: CustomText(
            blackText: 'I agree to the medidoc ',
            primaryColorText: 'Terms of Service and Privacy Policy',
          ),
        ),
      ],
    );
  }
}
