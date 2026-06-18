import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _lightThemeData;

  static ThemeData get darkTheme => _darkThemeData;

  /// Light Theme Configuration
  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
    ),

    inputDecorationTheme: _inputDecorationTheme,

    filledButtonTheme: _filledButtonThemeData,

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          AppColors.themeColor,
        ),
      ),
    ),

    appBarTheme: AppBarTheme(backgroundColor: Colors.white,)
  );

  static final FilledButtonThemeData _filledButtonThemeData = FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8))
      ),
    );


  /// Input Decoration Theme
  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    );


  /// Dark Theme Configuration
  static final ThemeData _darkThemeData = ThemeData(
    brightness: Brightness.dark,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
  );
}
