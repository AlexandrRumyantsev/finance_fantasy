import 'package:flutter/material.dart';

import '../infrastructure/managers/shared_prefs.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider(this._sharedPrefsManager) {
    _loadTheme();
  }

  final SharedPrefsManager _sharedPrefsManager;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveTheme();
    notifyListeners();
  }

  void setSystemTheme() {
    _themeMode = ThemeMode.system;
    _saveTheme();
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final themeString = _sharedPrefsManager.getThemeMode();
    switch (themeString) {
      case ThemeMode.light:
        _themeMode = ThemeMode.light;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.dark;
        break;
      default:
        _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    await _sharedPrefsManager.setThemeMode(_themeMode);
  }
}
