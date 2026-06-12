import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageToggleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void changeLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    _saveLocalLanguage(locale);
    notifyListeners();
  }

  Future<void> _saveLocalLanguage(Locale lang) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('locale', lang.languageCode);
  }

  Future<void> setDefaultLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? language = sharedPreferences.getString('locale');
    if (language != null) {
      _locale = _parseLocalLanguage(language);
    }
  }

  Locale _parseLocalLanguage(String lang) {
    switch (lang) {
      case 'bn':
        return const Locale('bn');

      case 'en':
      default:
        return const Locale('en');
    }
  }
}
