import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/features/cart/presentation/widgets/cart_item.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(isLeading: false, title: 'My Cards'),
      body: Column(children: [CartItem()]),
    );
  }
}
