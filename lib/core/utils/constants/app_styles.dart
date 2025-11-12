import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';

class AppStyles {
  AppStyles._();

  static String appFont = 'montserrat';

  static TextStyle reguler14({
    double fontSize = AppDimensions.small,
    Color color = Colors.white,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }

  static TextStyle reguler16({
    double fontSize = AppDimensions.medium,
    Color color = Colors.black,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }

  static TextStyle medium({
    double fontSize = AppDimensions.medium,
    Color color = Colors.black,
    TextDecoration? textDecoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
      height: height,
    );
  }

  static TextStyle semiBold16({
    double fontSize = AppDimensions.medium,
    Color color = Colors.black,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }

  static TextStyle semiBold18({
    double fontSize = AppDimensions.large,
    Color color = Colors.black,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }

  static TextStyle semiBold20({
    double fontSize = AppDimensions.xLarge,
    Color color = Colors.black,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }

  static TextStyle bold16({
    double fontSize = AppDimensions.medium,
    Color color = Colors.black,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }

  static TextStyle bold20({
    double fontSize = AppDimensions.xLarge,
    Color color = Colors.black,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }

  static TextStyle bold36({
    double fontSize = 36,
    Color color = Colors.white,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }
}
