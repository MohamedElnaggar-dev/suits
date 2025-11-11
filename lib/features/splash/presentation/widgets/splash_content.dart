import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.svgsLogo),
          const SizedBox(width: 10),
          SvgPicture.asset(Assets.svgsLogoTitle),
        ],
      ),
    );
  }
}
