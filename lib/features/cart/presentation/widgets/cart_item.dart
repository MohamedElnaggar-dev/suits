import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/features/cart/presentation/widgets/quantity_item.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          Assets.imagesBlackWomanSuits,
          width: 120,
          height: 140,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Text(
              'Classic Blazer',
              style: AppStyles.semiBold(color: Colors.black, fontSize: 14),
            ),
            Text(
              'Size : M',
              style: AppStyles.reguler(color: Colors.black, fontSize: 14),
            ),
            Text(
              '\$120',
              style: AppStyles.medium(color: Colors.black, fontSize: 16),
            ),
          ],
        ),

        const QuantityItem(),
      ],
    );
  }
}
