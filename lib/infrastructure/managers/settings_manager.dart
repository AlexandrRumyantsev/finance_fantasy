import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SettingsManager {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  SettingsManager(this._prefs, this._secureStorage);

  // Theme settings
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _prefs.setString('theme_mode', themeMode.name);
  }

  ThemeMode getThemeMode() {
    final themeString = _prefs.getString('theme_mode');
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  // Color settings
  Future<void> setPrimaryColor(Color color) async {
    await _prefs.setInt('primary_color', color.value);
  }

  Color getPrimaryColor() {
    final colorValue = _prefs.getInt('primary_color');
    return colorValue != null ? Color(colorValue) : Colors.green;
  }

  // Haptic feedback settings
  Future<void> setHapticEnabled(bool enabled) async {
    await _prefs.setBool('haptic_enabled', enabled);
  }

  bool getHapticEnabled() {
    return _prefs.getBool('haptic_enabled') ?? true;
  }

  // PIN code settings
  Future<void> setPinCode(String pinCode) async {
    await _secureStorage.write(key: 'pin_code', value: pinCode);
  }

  Future<String?> getPinCode() async {
    return await _secureStorage.read(key: 'pin_code');
  }

  Future<void> removePinCode() async {
    await _secureStorage.delete(key: 'pin_code');
  }

  // Biometric settings
  Future<void> setBiometricEnabled(bool enabled) async {
    await _prefs.setBool('biometric_enabled', enabled);
  }

  bool getBiometricEnabled() {
    return _prefs.getBool('biometric_enabled') ?? false;
  }

  // Language settings
  Future<void> setLanguage(String languageCode) async {
    await _prefs.setString('language_code', languageCode);
  }

  String getLanguage() {
    return _prefs.getString('language_code') ?? 'ru';
  }
}
