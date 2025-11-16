import 'package:suits_app/core/utils/constants/app_assets.dart';

class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});

  static List<CategoryModel> categoryList = [
    CategoryModel(name: 'Blazar', image: Assets.imagesSuitCategoryIcon),
    CategoryModel(name: 'Shirt', image: Assets.imagesShirtCategoryIcon),
    CategoryModel(name: 'Men Shoes', image: Assets.imagesMenShoesIcon),
    CategoryModel(name: 'Women Shoes', image: Assets.imagesWomenShoesIcon),
  ];
}
