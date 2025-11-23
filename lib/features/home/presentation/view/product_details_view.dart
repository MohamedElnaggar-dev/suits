import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/features/home/presentation/widgets/product_details_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Stack(
        children: [
          SizedBox(
            height: height * 0.65,
            width: double.infinity,
            child: Hero(
              tag: Assets.imagesBlackWomanSuits,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: Image.asset(
                  Assets.imagesBlackWomanSuits,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.45,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: const ProductDetailsWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
