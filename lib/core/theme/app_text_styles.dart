import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';

class AppTextStyles {
  static const String fontFamily = 'Roboto';

  static const TextStyle heading1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle bodyTextPrimary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle bodyTextSecondary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static const TextStyle bodyText3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.text3,
  );
}
