import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';

class NewCollectionWidget extends StatelessWidget {
  const NewCollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('New Collection', style: AppStyles.bold(fontSize: 16)),
                Text(
                  'Disscount 50% for \n the first transaction',
                  style: AppStyles.reguler(
                    fontSize: 12,
                    color: AppColors.hintTextColor,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Center(
                    child: Text(
                      'Shop Now',
                      style: AppStyles.semiBold(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SvgPicture.asset(Assets.svgsChoosingClothes),
          ],
        ),
      ),
    );
  }
}
