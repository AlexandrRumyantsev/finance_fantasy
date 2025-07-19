import 'package:flutter/material.dart';

import 'app_localizations.dart';
import 'settings_provider.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider(this._settingsProvider) {
    _loadLocale();
    _settingsProvider.addListener(_onSettingsChanged);
  }

  final SettingsProvider _settingsProvider;
  Locale _locale = const Locale('ru');

  Locale get locale => _locale;

  Future<void> _loadLocale() async {
    try {
      final languageCode = _settingsProvider.language;
      _locale = Locale(languageCode);
    } catch (e) {
      _locale = const Locale('ru');
    }
    notifyListeners();
  }

  void _onSettingsChanged() {
    final languageCode = _settingsProvider.language;
    if (_locale.languageCode != languageCode) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> setLocale(String languageCode) async {
    await _settingsProvider.setLanguage(languageCode);
  }

  Future<void> refreshLocale() async {
    await _loadLocale();
  }

  @override
  void dispose() {
    _settingsProvider.removeListener(_onSettingsChanged);
    super.dispose();
  }

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static AppLocalizations? ofNullable(BuildContext context) {
    return AppLocalizations.of(context);
  }
}
