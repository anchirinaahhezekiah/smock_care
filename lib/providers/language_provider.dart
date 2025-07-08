import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en', 'US');

  Locale get currentLocale => _currentLocale;

  void setLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
    _saveToPrefs();
  }

  void _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', _currentLocale.languageCode);
    prefs.setString('country', _currentLocale.countryCode ?? '');
  }

  void loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language') ?? 'en';
    final countryCode = prefs.getString('country') ?? 'US';
    _currentLocale = Locale(languageCode, countryCode);
    notifyListeners();
  }
}
