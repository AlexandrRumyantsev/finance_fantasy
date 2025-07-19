// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Finance Fantasy';

  @override
  String get appSubtitle => 'Manage your finances';

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get security => 'Security';

  @override
  String get interface => 'Interface';

  @override
  String get theme => 'Theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get selectTheme => 'Select theme';

  @override
  String get primaryColor => 'Primary color';

  @override
  String get primaryColorDescription => 'Choose app color';

  @override
  String get selectColor => 'Select color';

  @override
  String get done => 'Done';

  @override
  String get pinCode => 'PIN Code';

  @override
  String get pinCodeDescription => 'App protection';

  @override
  String get pinCodeSet => 'PIN code set';

  @override
  String get pinCodeSetup => 'PIN Code Setup';

  @override
  String get enterPinCode => 'Enter PIN Code';

  @override
  String get createPinCode => 'Create PIN Code';

  @override
  String get confirmPinCode => 'Confirm PIN Code';

  @override
  String get enterPinCodeDescription => 'Enter 4-digit PIN code to access the app';

  @override
  String get createPinCodeDescription => 'Enter 4-digit PIN code to protect the app';

  @override
  String get confirmPinCodeDescription => 'Repeat the entered PIN code';

  @override
  String get pinCodeSetSuccess => 'PIN code set';

  @override
  String get disablePinCode => 'Disable PIN Code';

  @override
  String get disablePinCodeConfirm => 'Are you sure you want to disable PIN code? The app will no longer require PIN code entry on startup.';

  @override
  String get pinCodeDisabled => 'PIN code disabled';

  @override
  String get forgotPinCode => 'Forgot PIN code?';

  @override
  String get resetPinCode => 'Reset PIN Code';

  @override
  String get resetPinCodeDescription => 'To reset PIN code, you need to reinstall the app. All data will be deleted.';

  @override
  String get reset => 'Reset';

  @override
  String get biometric => 'Biometric';

  @override
  String get biometricDescription => 'Face ID / Touch ID';

  @override
  String get confirmIdentity => 'Confirm your identity';

  @override
  String get haptic => 'Haptic';

  @override
  String get hapticDescription => 'Tactile feedback';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get russian => 'Русский';

  @override
  String get english => 'English';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get total => 'Total';

  @override
  String get amount => 'Amount';

  @override
  String get date => 'Date';

  @override
  String get comment => 'Comment';

  @override
  String get category => 'Category';

  @override
  String get selectCategory => 'Select category';

  @override
  String get noCategoriesAvailable => 'No categories available';

  @override
  String get start => 'Start';

  @override
  String get end => 'End';

  @override
  String deleteTransaction(Object type) {
    return 'Delete $type';
  }

  @override
  String get deleteTransactionIncome => 'income';

  @override
  String get deleteTransactionExpense => 'expense';

  @override
  String get expenses => 'Expenses';

  @override
  String get incomes => 'Incomes';

  @override
  String get account => 'Account';

  @override
  String get categories => 'Categories';

  @override
  String get myCategories => 'My Categories';

  @override
  String get myAccount => 'My Account';

  @override
  String get myHistory => 'My History';

  @override
  String get expensesToday => 'Expenses today';

  @override
  String get incomesToday => 'Incomes today';

  @override
  String get findCategory => 'Find category';

  @override
  String get saveError => 'Error saving';
}
