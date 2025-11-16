import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/features/home/data/model/category_model.dart';

class CategoryFieldWidget extends StatelessWidget {
  const CategoryFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories', style: AppStyles.bold(fontSize: 20)),
            SizedBox(width: 10),
            Text(
              'See All',
              style: AppStyles.reguler(
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 110,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: CategoryModel.categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return categoryIemWidget(
                imageName: CategoryModel.categoryList[index].image,
                text: CategoryModel.categoryList[index].name,
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget categoryIemWidget({required String imageName, required String text}) {
  return Padding(
    padding: const EdgeInsets.only(right: 24.0),
    child: Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.primaryColor, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(imageName),
          ),
        ),
        const SizedBox(height: 5),
        Text(text, style: AppStyles.bold(fontSize: 12)),
      ],
    ),
  );
}
