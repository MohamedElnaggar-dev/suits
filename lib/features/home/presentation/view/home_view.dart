import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/features/home/presentation/widgets/category_field_widget.dart';
import 'package:suits_app/features/home/presentation/widgets/flash_sale_widget.dart';
import 'package:suits_app/features/home/presentation/widgets/grid_view_items.dart';
import 'package:suits_app/features/home/presentation/widgets/new_collection_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> images = [
    Assets.imagesBlackWomanSuits,
    Assets.imagesBrownShirt,
    Assets.imagesGrayWomanBlazer,
    Assets.imagesBlueBlackWomanSuit,
  ];

  final String productName = 'Product Name';

  final String price = '\$83.97';

  final String rating = ' 4.5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        isLeading: false,
        title: 'Hello mohamed',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.imagesBell),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Column(
            children: [
              const NewCollectionWidget(),
              const SizedBox(height: AppDimensions.medium),
              const CategoryFieldWidget(),
              const SizedBox(height: AppDimensions.medium),
              const FlashSaleWidget(),
              const SizedBox(height: AppDimensions.medium),
              GridViewItems(
                onTap: (index) {
                  context.push(
                    AppRouter.kProductDetailsView,
                    extra: {
                      'image': images[index],
                      'productName': productName,
                      'price': price,
                      'rating': rating,
                    },
                  );
                },
                images: images,
                productName: productName,
                price: price,
                rating: rating,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
