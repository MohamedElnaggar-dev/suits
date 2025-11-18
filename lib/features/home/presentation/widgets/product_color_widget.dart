import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class ProductColorwidget extends StatefulWidget {
  const ProductColorwidget({super.key});

  @override
  State<ProductColorwidget> createState() => _ProductColoreWidgetState();
}

class _ProductColoreWidgetState extends State<ProductColorwidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Color : ', style: AppStyles.bold(fontSize: 20)),
        const SizedBox(height: AppDimensions.medium),
        Expanded(
          child: SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppColors.suitsSelectorColors.length,
              itemBuilder: (context, index) {
                return productColorItem(
                  color: AppColors.suitsSelectorColors[index],
                  index: index,
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

Widget productColorItem({
  required Color color,
  required int index,
  required int selectedIndex,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: index == selectedIndex
              ? AppColors.primaryColor
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 1),
        ),
      ),
    ),
  );
}
