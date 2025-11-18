import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';

class AddToFavouriteWidget extends StatefulWidget {
  const AddToFavouriteWidget({super.key});

  @override
  State<AddToFavouriteWidget> createState() => _AddToFavouriteWidgetState();
}

class _AddToFavouriteWidgetState extends State<AddToFavouriteWidget> {
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
              ? Image.asset(
                  Assets.imagesUnselectedHeart,
                  color: Colors.grey.shade300,
                )
              : Image.asset(Assets.imagesSelectedHeart),
        ),
      ),
    );
  }
}
