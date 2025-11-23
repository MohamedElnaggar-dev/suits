import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';

class QuantityItem extends StatefulWidget {
  const QuantityItem({super.key});

  @override
  State<QuantityItem> createState() => _QuantityItemState();
}

class _QuantityItemState extends State<QuantityItem> {
  int quantity = 1;

  void increase() {
    setState(() {
      quantity++;
    });
  }

  void decrease() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: decrease,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),

            child: const Icon(CupertinoIcons.minus, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          child: Text(
            quantity.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),

        GestureDetector(
          onTap: increase,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),

            child: const Icon(CupertinoIcons.plus, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
