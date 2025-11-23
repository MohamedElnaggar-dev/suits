import 'package:flutter/material.dart';
import 'package:suits_app/features/home/presentation/widgets/product_item.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    super.key,
    this.onTap,
    required this.images,
    required this.productName,
    required this.price,
    required this.rating,
  });
  final void Function(int index)? onTap;
  final List<String> images;
  final String productName;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
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
          onTap: () => onTap!(index),

          child: ProductItem(
            image: images[index],
            productName: productName,
            price: price,
            rating: rating,
          ),
        );
      },
    );
  }
}
