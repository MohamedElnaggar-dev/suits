import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.productName,
    required this.price,
    required this.rating,
  });
  final String image;
  final String productName;
  final String price;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productName,
              style: AppStyles.semiBold(fontSize: 14, color: Colors.black),
            ),
            Row(
              children: [
                Image.asset(Assets.imagesStar, height: 15, width: 15),

                Text(rating),
                const SizedBox(width: 5),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(price),
      ],
    );
  }
}
