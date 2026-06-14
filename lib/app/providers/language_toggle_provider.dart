import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageToggleProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  final List<Locale> _locales = [Locale('en'), Locale('bn')];
  List<Locale> get supportedLocales => _locales;

  Locale get currentLocal => _currentLocale;

  void changeLocale(Locale locale) {
    if (_currentLocale == locale) return;
    _currentLocale = locale;
    _saveLocale(locale);
    notifyListeners();
  }

  Future<void> _saveLocale(Locale lang) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('locale', lang.languageCode);
  }

  Future<void> setDefaultLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? locale = sharedPreferences.getString('locale');
    if (locale != null) {
      _currentLocale = Locale(locale);
    }
  }
}
