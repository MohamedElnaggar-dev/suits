import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';

class BackToHomeWidget extends StatefulWidget {
  const BackToHomeWidget({super.key});

  @override
  State<BackToHomeWidget> createState() => _BackToHomeWidgetState();
}

class _BackToHomeWidgetState extends State<BackToHomeWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isSelected = !isSelected),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isSelected == false
              ? const Icon(CupertinoIcons.home, color: Colors.grey)
              : const Icon(CupertinoIcons.home, color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
