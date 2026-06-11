import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _lightThemeData;

  static ThemeData get darkTheme => _darkThemeData;

  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
  );

  static final ThemeData _darkThemeData = ThemeData(
    brightness: Brightness.dark,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
  );
}
