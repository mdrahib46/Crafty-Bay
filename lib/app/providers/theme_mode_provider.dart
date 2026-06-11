import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get themeMode => _currentThemeMode;

  void changeThemeMode(ThemeMode theme) {
    _currentThemeMode = theme;
    _saveThemeMode(theme);
    notifyListeners();
  }

  Future<void> _saveThemeMode(ThemeMode mode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('theme-mode', mode.name);
  }

  Future<void> setDefaultThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? themeMode = sharedPreferences.getString('theme-mode');

    if (themeMode != null) {
      _currentThemeMode = _parseThemeMode(themeMode);
      notifyListeners();
    }
  }

  ThemeMode _parseThemeMode(String themeMode) {
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;

      case 'dark':
        return ThemeMode.dark;

      default:
        return ThemeMode.system;
    }
  }
}
