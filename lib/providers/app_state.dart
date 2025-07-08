// lib/providers/app_state.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  bool _isOfflineMode = false;
  bool _isFirstTime = true;
  String _userName = '';

  bool get isOfflineMode => _isOfflineMode;

  bool get isFirstTime => _isFirstTime;

  String get userName => _userName;

  void setOfflineMode(bool value) {
    _isOfflineMode = value;
    notifyListeners();
    _saveToPrefs();
  }

  void setFirstTime(bool value) {
    _isFirstTime = value;
    notifyListeners();
    _saveToPrefs();
  }

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
    _saveToPrefs();
  }

  void _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isOfflineMode', _isOfflineMode);
    prefs.setBool('isFirstTime', _isFirstTime);
    prefs.setString('userName', _userName);
  }

  void loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isOfflineMode = prefs.getBool('isOfflineMode') ?? false;
    _isFirstTime = prefs.getBool('isFirstTime') ?? true;
    _userName = prefs.getString('userName') ?? '';
    notifyListeners();
  }
}