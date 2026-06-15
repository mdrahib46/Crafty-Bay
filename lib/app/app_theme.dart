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
      labelLarge: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)
    ),

    inputDecorationTheme: _inputDecorationTheme()
  );




  /// Input Decoration Theme
  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
    contentPadding: .only(left: 12),
    border: OutlineInputBorder(
      borderSide: BorderSide( color: AppColors.themeColor,width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide( color: AppColors.themeColor,width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide( color: AppColors.themeColor,width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide( color: Colors.red, width: 2),
    ),
  );
  }





  /// Dark Theme Configuration
  static final ThemeData _darkThemeData = ThemeData(
    brightness: Brightness.dark,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
  );
}
