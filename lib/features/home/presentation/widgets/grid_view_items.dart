import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';

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
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return gridViewItem(images, index);
      },
    );
  }

  Container gridViewItem(List<String> images, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(images[index]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
