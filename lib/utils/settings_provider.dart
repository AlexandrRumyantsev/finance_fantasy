import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../infrastructure/managers/settings_manager.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider(this._settingsManager) {
    _loadSettings();
  }

  final SettingsManager _settingsManager;
  final LocalAuthentication _localAuth = LocalAuthentication();

  bool _hapticEnabled = true;
  bool _biometricEnabled = false;
  String _language = 'ru';
  bool _isBiometricAvailable = false;

  bool get hapticEnabled => _hapticEnabled;
  bool get biometricEnabled => _biometricEnabled;
  String get language => _language;
  bool get isBiometricAvailable => _isBiometricAvailable;

  Future<void> _loadSettings() async {
    try {
      _hapticEnabled = _settingsManager.getHapticEnabled();
      _biometricEnabled = _settingsManager.getBiometricEnabled();
      _language = _settingsManager.getLanguage();
      _isBiometricAvailable = await _localAuth.canCheckBiometrics;
    } catch (e) {
      _hapticEnabled = true;
      _biometricEnabled = false;
      _language = 'ru';
      _isBiometricAvailable = false;
    }
    notifyListeners();
  }

  Future<void> setHapticEnabled(bool enabled) async {
    _hapticEnabled = enabled;
    await _settingsManager.setHapticEnabled(enabled);
    notifyListeners();
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    _biometricEnabled = enabled;
    await _settingsManager.setBiometricEnabled(enabled);
    notifyListeners();
  }

  Future<void> setLanguage(String languageCode) async {
    _language = languageCode;
    await _settingsManager.setLanguage(languageCode);
    notifyListeners();
  }

  Future<bool> authenticateWithBiometrics() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: 'Confirm your identity',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  Future<String?> getPinCode() {
    return _settingsManager.getPinCode();
  }

  Future<void> setPinCode(String pinCode) async {
    await _settingsManager.setPinCode(pinCode);
  }

  Future<void> removePinCode() async {
    await _settingsManager.removePinCode();
  }

  Future<bool> isPinCodeSet() async {
    final pinCode = await _settingsManager.getPinCode();
    return pinCode != null && pinCode.isNotEmpty;
  }
}
