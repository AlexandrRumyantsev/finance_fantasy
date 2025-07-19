// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String get appTitle => _localizedValues[locale.languageCode]!['appTitle']!;
  String get appSubtitle =>
      _localizedValues[locale.languageCode]!['appSubtitle']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get appearance =>
      _localizedValues[locale.languageCode]!['appearance']!;
  String get security => _localizedValues[locale.languageCode]!['security']!;
  String get interface => _localizedValues[locale.languageCode]!['interface']!;
  String get theme => _localizedValues[locale.languageCode]!['theme']!;
  String get themeLight =>
      _localizedValues[locale.languageCode]!['themeLight']!;
  String get themeDark => _localizedValues[locale.languageCode]!['themeDark']!;
  String get themeSystem =>
      _localizedValues[locale.languageCode]!['themeSystem']!;
  String get selectTheme =>
      _localizedValues[locale.languageCode]!['selectTheme']!;
  String get primaryColor =>
      _localizedValues[locale.languageCode]!['primaryColor']!;
  String get primaryColorDescription =>
      _localizedValues[locale.languageCode]!['primaryColorDescription']!;
  String get selectColor =>
      _localizedValues[locale.languageCode]!['selectColor']!;
  String get done => _localizedValues[locale.languageCode]!['done']!;
  String get pinCode => _localizedValues[locale.languageCode]!['pinCode']!;
  String get pinCodeDescription =>
      _localizedValues[locale.languageCode]!['pinCodeDescription']!;
  String get pinCodeSet =>
      _localizedValues[locale.languageCode]!['pinCodeSet']!;
  String get pinCodeSetup =>
      _localizedValues[locale.languageCode]!['pinCodeSetup']!;
  String get enterPinCode =>
      _localizedValues[locale.languageCode]!['enterPinCode']!;
  String get createPinCode =>
      _localizedValues[locale.languageCode]!['createPinCode']!;
  String get confirmPinCode =>
      _localizedValues[locale.languageCode]!['confirmPinCode']!;
  String get enterPinCodeDescription =>
      _localizedValues[locale.languageCode]!['enterPinCodeDescription']!;
  String get createPinCodeDescription =>
      _localizedValues[locale.languageCode]!['createPinCodeDescription']!;
  String get confirmPinCodeDescription =>
      _localizedValues[locale.languageCode]!['confirmPinCodeDescription']!;
  String get pinCodeSetSuccess =>
      _localizedValues[locale.languageCode]!['pinCodeSetSuccess']!;
  String get disablePinCode =>
      _localizedValues[locale.languageCode]!['disablePinCode']!;
  String get disablePinCodeConfirm =>
      _localizedValues[locale.languageCode]!['disablePinCodeConfirm']!;
  String get pinCodeDisabled =>
      _localizedValues[locale.languageCode]!['pinCodeDisabled']!;
  String get forgotPinCode =>
      _localizedValues[locale.languageCode]!['forgotPinCode']!;
  String get resetPinCode =>
      _localizedValues[locale.languageCode]!['resetPinCode']!;
  String get resetPinCodeDescription =>
      _localizedValues[locale.languageCode]!['resetPinCodeDescription']!;
  String get reset => _localizedValues[locale.languageCode]!['reset']!;
  String get biometric => _localizedValues[locale.languageCode]!['biometric']!;
  String get biometricDescription =>
      _localizedValues[locale.languageCode]!['biometricDescription']!;
  String get confirmIdentity =>
      _localizedValues[locale.languageCode]!['confirmIdentity']!;
  String get haptic => _localizedValues[locale.languageCode]!['haptic']!;
  String get hapticDescription =>
      _localizedValues[locale.languageCode]!['hapticDescription']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get selectLanguage =>
      _localizedValues[locale.languageCode]!['selectLanguage']!;
  String get russian => _localizedValues[locale.languageCode]!['russian']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get delete => _localizedValues[locale.languageCode]!['delete']!;
  String get total => _localizedValues[locale.languageCode]!['total']!;
  String get amount => _localizedValues[locale.languageCode]!['amount']!;
  String get currency => _localizedValues[locale.languageCode]!['currency']!;
  String get date => _localizedValues[locale.languageCode]!['date']!;
  String get comment => _localizedValues[locale.languageCode]!['comment']!;
  String get category => _localizedValues[locale.languageCode]!['category']!;
  String get selectCategory =>
      _localizedValues[locale.languageCode]!['selectCategory']!;
  String get noCategoriesAvailable =>
      _localizedValues[locale.languageCode]!['noCategoriesAvailable']!;
  String get start => _localizedValues[locale.languageCode]!['start']!;
  String get end => _localizedValues[locale.languageCode]!['end']!;
  String get deleteTransactionIncome =>
      _localizedValues[locale.languageCode]!['deleteTransactionIncome']!;
  String get deleteTransactionExpense =>
      _localizedValues[locale.languageCode]!['deleteTransactionExpense']!;
  String get expenses => _localizedValues[locale.languageCode]!['expenses']!;
  String get incomes => _localizedValues[locale.languageCode]!['incomes']!;
  String get account => _localizedValues[locale.languageCode]!['account']!;
  String get categories =>
      _localizedValues[locale.languageCode]!['categories']!;
  String get myCategories =>
      _localizedValues[locale.languageCode]!['myCategories']!;
  String get myAccount => _localizedValues[locale.languageCode]!['myAccount']!;
  String get myHistory => _localizedValues[locale.languageCode]!['myHistory']!;
  String get expensesToday =>
      _localizedValues[locale.languageCode]!['expensesToday']!;
  String get incomesToday =>
      _localizedValues[locale.languageCode]!['incomesToday']!;
  String get findCategory =>
      _localizedValues[locale.languageCode]!['findCategory']!;
  String get saveError => _localizedValues[locale.languageCode]!['saveError']!;

  String deleteTransaction(String type) {
    final base = _localizedValues[locale.languageCode]!['deleteTransaction']!;
    return base.replaceAll('{type}', type);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'ru': {
      'appTitle': 'Finance Fantasy',
      'appSubtitle': 'Управляйте своими финансами',
      'settings': 'Настройки',
      'appearance': 'Внешний вид',
      'security': 'Безопасность',
      'interface': 'Интерфейс',
      'theme': 'Тема',
      'themeLight': 'Светлая',
      'themeDark': 'Темная',
      'themeSystem': 'Системная',
      'selectTheme': 'Выберите тему',
      'primaryColor': 'Основной цвет',
      'primaryColorDescription': 'Выберите цвет приложения',
      'selectColor': 'Выберите цвет',
      'done': 'Готово',
      'pinCode': 'PIN-код',
      'pinCodeDescription': 'Защита приложения',
      'pinCodeSet': 'PIN-код установлен',
      'pinCodeSetup': 'Установка PIN-кода',
      'enterPinCode': 'Введите PIN-код',
      'createPinCode': 'Создайте PIN-код',
      'confirmPinCode': 'Подтвердите PIN-код',
      'enterPinCodeDescription':
          'Введите 4-значный PIN-код для входа в приложение',
      'createPinCodeDescription':
          'Введите 4-значный PIN-код для защиты приложения',
      'confirmPinCodeDescription': 'Повторите введенный PIN-код',
      'pinCodeSetSuccess': 'PIN-код установлен',
      'disablePinCode': 'Отключить PIN-код',
      'disablePinCodeConfirm':
          'Вы уверены, что хотите отключить PIN-код? Приложение больше не будет требовать ввода PIN-кода при запуске.',
      'pinCodeDisabled': 'PIN-код отключен',
      'forgotPinCode': 'Забыли PIN-код?',
      'resetPinCode': 'Сброс PIN-кода',
      'resetPinCodeDescription':
          'Для сброса PIN-кода необходимо переустановить приложение. Все данные будут удалены.',
      'reset': 'Сбросить',
      'biometric': 'Биометрия',
      'biometricDescription': 'Face ID / Touch ID',
      'confirmIdentity': 'Подтвердите вашу личность',
      'haptic': 'Хаптики',
      'hapticDescription': 'Тактильная обратная связь',
      'language': 'Язык',
      'selectLanguage': 'Выберите язык',
      'russian': 'Русский',
      'english': 'English',
      'cancel': 'Отмена',
      'delete': 'Удалить',
      'total': 'Всего',
      'amount': 'Сумма',
      'currency': 'RUB',
      'date': 'Дата',
      'comment': 'Комментарий',
      'category': 'Категория',
      'selectCategory': 'Выберите категорию',
      'noCategoriesAvailable': 'Нет доступных категорий',
      'start': 'Начало',
      'end': 'Конец',
      'deleteTransaction': 'Удалить {type}',
      'deleteTransactionIncome': 'доход',
      'deleteTransactionExpense': 'расход',
      'expenses': 'Расходы',
      'incomes': 'Доходы',
      'account': 'Счет',
      'categories': 'Статьи',
      'myCategories': 'Мои статьи',
      'myAccount': 'Мой счет',
      'myHistory': 'Моя история',
      'expensesToday': 'Расходы сегодня',
      'incomesToday': 'Доходы сегодня',
      'findCategory': 'Найти статью',
      'saveError': 'Ошибка при сохранении',
    },
    'en': {
      'appTitle': 'Finance Fantasy',
      'appSubtitle': 'Manage your finances',
      'settings': 'Settings',
      'appearance': 'Appearance',
      'security': 'Security',
      'interface': 'Interface',
      'theme': 'Theme',
      'themeLight': 'Light',
      'themeDark': 'Dark',
      'themeSystem': 'System',
      'selectTheme': 'Select theme',
      'primaryColor': 'Primary color',
      'primaryColorDescription': 'Choose app color',
      'selectColor': 'Select color',
      'done': 'Done',
      'pinCode': 'PIN Code',
      'pinCodeDescription': 'App protection',
      'pinCodeSet': 'PIN code set',
      'pinCodeSetup': 'PIN Code Setup',
      'enterPinCode': 'Enter PIN Code',
      'createPinCode': 'Create PIN Code',
      'confirmPinCode': 'Confirm PIN Code',
      'enterPinCodeDescription': 'Enter 4-digit PIN code to access the app',
      'createPinCodeDescription': 'Enter 4-digit PIN code to protect the app',
      'confirmPinCodeDescription': 'Repeat the entered PIN code',
      'pinCodeSetSuccess': 'PIN code set',
      'disablePinCode': 'Disable PIN Code',
      'disablePinCodeConfirm':
          'Are you sure you want to disable PIN code? The app will no longer require PIN code entry on startup.',
      'pinCodeDisabled': 'PIN code disabled',
      'forgotPinCode': 'Forgot PIN code?',
      'resetPinCode': 'Reset PIN Code',
      'resetPinCodeDescription':
          'To reset PIN code, you need to reinstall the app. All data will be deleted.',
      'reset': 'Reset',
      'biometric': 'Biometric',
      'biometricDescription': 'Face ID / Touch ID',
      'confirmIdentity': 'Confirm your identity',
      'haptic': 'Haptic',
      'hapticDescription': 'Tactile feedback',
      'language': 'Language',
      'selectLanguage': 'Select language',
      'russian': 'Русский',
      'english': 'English',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'total': 'Total',
      'amount': 'Amount',
      'currency': 'RUB',
      'date': 'Date',
      'comment': 'Comment',
      'category': 'Category',
      'selectCategory': 'Select category',
      'noCategoriesAvailable': 'No categories available',
      'start': 'Start',
      'end': 'End',
      'deleteTransaction': 'Delete {type}',
      'deleteTransactionIncome': 'income',
      'deleteTransactionExpense': 'expense',
      'expenses': 'Expenses',
      'incomes': 'Incomes',
      'account': 'Account',
      'categories': 'Categories',
      'myCategories': 'My Categories',
      'myAccount': 'My Account',
      'myHistory': 'My History',
      'expensesToday': 'Expenses today',
      'incomesToday': 'Incomes today',
      'findCategory': 'Find category',
      'saveError': 'Error saving',
    },
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
