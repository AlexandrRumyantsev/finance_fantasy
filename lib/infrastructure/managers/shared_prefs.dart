import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefsManager {
  final SharedPreferences _prefs;

  SharedPrefsManager(this._prefs);

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _prefs.setString('theme_mode', themeMode.name);
  }

  ThemeMode getThemeMode() {
    return ThemeMode.values.firstWhere(
      (e) => e.name == _prefs.getString('theme_mode'),
      orElse: () => ThemeMode.light,
    );
  }
}
