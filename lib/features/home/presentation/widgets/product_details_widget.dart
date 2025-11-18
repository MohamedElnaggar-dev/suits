import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/features/home/presentation/widgets/product_color_widget.dart';
import 'package:suits_app/features/home/presentation/widgets/product_size_widget.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Classic Blazar',
                style: AppStyles.medium(fontSize: 20, color: Colors.black),
              ),
              Row(
                children: [
                  Image.asset(Assets.imagesStar, height: 15, width: 15),
                  const SizedBox(width: 5),
                  Text('5.0', style: AppStyles.reguler(color: Colors.black)),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.medium),
          Text(
            'Product Details',
            style: AppStyles.medium(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: AppDimensions.medium),
          Text(
            'cotton sweat shirt with a text point',
            style: AppStyles.medium(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: AppDimensions.medium),

          Divider(thickness: 1, color: Colors.grey.shade300),
          const SizedBox(height: AppDimensions.medium),
          const ProductColorwidget(),
          const SizedBox(height: 16),
          const ProductSizewidget(),
          const SizedBox(height: AppDimensions.medium),
          Row(
            children: [AppButton(text: 'Add to Cart', onTap: () {})],
          ),
        ],
      ),
    );
  }
}
