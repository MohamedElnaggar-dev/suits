import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class ProductSizewidget extends StatefulWidget {
  const ProductSizewidget({super.key});

  @override
  State<ProductSizewidget> createState() => _ProductSizeWidgetState();
}

class _ProductSizeWidgetState extends State<ProductSizewidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> size = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL', 'XXXXL', 'XXXXXL'];

    return Row(
      children: [
        Text('size : ', style: AppStyles.bold(fontSize: 20)),
        const SizedBox(height: AppDimensions.medium),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: size.length,
              itemBuilder: (context, index) {
                return productSizeItem(
                  size: size[index],
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

Widget productSizeItem({
  required String size,
  required int index,
  required int selectedIndex,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: index == selectedIndex
            ? AppColors.primaryColor
            : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          size,
          style: AppStyles.bold(
            fontSize: 16,
            color: index == selectedIndex ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}
