import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/features/home/presentation/widgets/product_item.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      Assets.imagesBlackWomanSuits,
      Assets.imagesBrownShirt,
      Assets.imagesGrayWomanBlazer,
      Assets.imagesBlueBlackWomanSuit,
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(AppRouter.kProductDetailsView);
          },
          child: ProductItem(
            image: images[index],
            productName: 'Product Name',
            price: '\$83.97',
            rating: ' 4.5',
          ),
        );
      },
    );
  }
}
