import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_dimensions.dart';
import '../../../../core/utils/constants/app_styles.dart';

class FlashSaleWidget extends StatefulWidget {
  const FlashSaleWidget({super.key});

  @override
  State<FlashSaleWidget> createState() => _FlashSaleWidgetState();
}

class _FlashSaleWidgetState extends State<FlashSaleWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> title = ['All', 'Newest', 'Popular', 'Men', 'Women'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Flash Sale', style: AppStyles.bold(fontSize: 20)),
        const SizedBox(height: AppDimensions.medium),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: title.length,
            itemBuilder: (context, index) {
              return flashSaleItemWidget(
                text: title[index],
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
      ],
    );
  }
}

Widget flashSaleItemWidget({
  required String text,
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
          text,
          style: AppStyles.bold(
            fontSize: 16,
            color: index == selectedIndex ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}
