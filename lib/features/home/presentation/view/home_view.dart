import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/features/home/presentation/widgets/new_collection_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        isLeading: false,
        title: 'Hello User',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
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
      body: Padding(
        padding: AppDimensions.pagePadding,
        child: NewCollectionWidget(),
      ),
    );
  }
}
