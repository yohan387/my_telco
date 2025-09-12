import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.orange,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    fontFamily: AppTextStyles.fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      scrolledUnderElevation: 1,
      elevation: 0,
      foregroundColor: AppColors.black,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.grey.withAlpha(55),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.white,
      indicatorColor: AppColors.orangeGradiant2,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) =>
            states.contains(WidgetState.selected)
                ? const TextStyle(color: AppColors.orange)
                : const TextStyle(color: AppColors.black),
      ),
    ),
  );
}
