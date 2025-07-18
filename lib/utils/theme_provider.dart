import 'package:flutter/material.dart';

import '../infrastructure/managers/settings_manager.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider(this._settingsManager) {
    _loadTheme();
    _loadPrimaryColor();
  }

  final SettingsManager _settingsManager;

  ThemeMode _themeMode = ThemeMode.system;
  Color _primaryColor = Colors.green;

  ThemeMode get themeMode => _themeMode;
  Color get primaryColor => _primaryColor;

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    _saveTheme();
    notifyListeners();
  }

  void setPrimaryColor(Color color) {
    _primaryColor = color;
    _savePrimaryColor();
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    _themeMode = _settingsManager.getThemeMode();
    notifyListeners();
  }

  Future<void> _loadPrimaryColor() async {
    _primaryColor = _settingsManager.getPrimaryColor();
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    await _settingsManager.setThemeMode(_themeMode);
  }

  Future<void> _savePrimaryColor() async {
    await _settingsManager.setPrimaryColor(_primaryColor);
  }
}
