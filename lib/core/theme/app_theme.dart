import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/app_constant.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: Colors.orange,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: AppTextStyles.heading2,
      iconTheme: IconThemeData(color: AppColors.orange),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.white,
      indicatorColor: AppColors.orangeGradiant2,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) => states.contains(WidgetState.selected)
            ? const TextStyle(color: AppColors.orange)
            : const TextStyle(color: AppColors.textPrimary),
      ),
    ),
  );
}
