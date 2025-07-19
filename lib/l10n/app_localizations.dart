import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Finance Fantasy'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your finances'**
  String get appSubtitle;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @interface.
  ///
  /// In en, this message translates to:
  /// **'Interface'**
  String get interface;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @selectTheme.
  ///
  /// In en, this message translates to:
  /// **'Select theme'**
  String get selectTheme;

  /// No description provided for @primaryColor.
  ///
  /// In en, this message translates to:
  /// **'Primary color'**
  String get primaryColor;

  /// No description provided for @primaryColorDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose app color'**
  String get primaryColorDescription;

  /// No description provided for @selectColor.
  ///
  /// In en, this message translates to:
  /// **'Select color'**
  String get selectColor;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @pinCode.
  ///
  /// In en, this message translates to:
  /// **'PIN Code'**
  String get pinCode;

  /// No description provided for @pinCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'App protection'**
  String get pinCodeDescription;

  /// No description provided for @pinCodeSet.
  ///
  /// In en, this message translates to:
  /// **'PIN code set'**
  String get pinCodeSet;

  /// No description provided for @pinCodeSetup.
  ///
  /// In en, this message translates to:
  /// **'PIN Code Setup'**
  String get pinCodeSetup;

  /// No description provided for @enterPinCode.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN Code'**
  String get enterPinCode;

  /// No description provided for @createPinCode.
  ///
  /// In en, this message translates to:
  /// **'Create PIN Code'**
  String get createPinCode;

  /// No description provided for @confirmPinCode.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN Code'**
  String get confirmPinCode;

  /// No description provided for @enterPinCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter 4-digit PIN code to access the app'**
  String get enterPinCodeDescription;

  /// No description provided for @createPinCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter 4-digit PIN code to protect the app'**
  String get createPinCodeDescription;

  /// No description provided for @confirmPinCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'Repeat the entered PIN code'**
  String get confirmPinCodeDescription;

  /// No description provided for @pinCodeSetSuccess.
  ///
  /// In en, this message translates to:
  /// **'PIN code set'**
  String get pinCodeSetSuccess;

  /// No description provided for @disablePinCode.
  ///
  /// In en, this message translates to:
  /// **'Disable PIN Code'**
  String get disablePinCode;

  /// No description provided for @disablePinCodeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to disable PIN code? The app will no longer require PIN code entry on startup.'**
  String get disablePinCodeConfirm;

  /// No description provided for @pinCodeDisabled.
  ///
  /// In en, this message translates to:
  /// **'PIN code disabled'**
  String get pinCodeDisabled;

  /// No description provided for @forgotPinCode.
  ///
  /// In en, this message translates to:
  /// **'Forgot PIN code?'**
  String get forgotPinCode;

  /// No description provided for @resetPinCode.
  ///
  /// In en, this message translates to:
  /// **'Reset PIN Code'**
  String get resetPinCode;

  /// No description provided for @resetPinCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'To reset PIN code, you need to reinstall the app. All data will be deleted.'**
  String get resetPinCodeDescription;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @biometric.
  ///
  /// In en, this message translates to:
  /// **'Biometric'**
  String get biometric;

  /// No description provided for @biometricDescription.
  ///
  /// In en, this message translates to:
  /// **'Face ID / Touch ID'**
  String get biometricDescription;

  /// No description provided for @confirmIdentity.
  ///
  /// In en, this message translates to:
  /// **'Confirm your identity'**
  String get confirmIdentity;

  /// No description provided for @haptic.
  ///
  /// In en, this message translates to:
  /// **'Haptic'**
  String get haptic;

  /// No description provided for @hapticDescription.
  ///
  /// In en, this message translates to:
  /// **'Tactile feedback'**
  String get hapticDescription;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get russian;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get selectCategory;

  /// No description provided for @noCategoriesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No categories available'**
  String get noCategoriesAvailable;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @deleteTransaction.
  ///
  /// In en, this message translates to:
  /// **'Delete {type}'**
  String deleteTransaction(Object type);

  /// No description provided for @deleteTransactionIncome.
  ///
  /// In en, this message translates to:
  /// **'income'**
  String get deleteTransactionIncome;

  /// No description provided for @deleteTransactionExpense.
  ///
  /// In en, this message translates to:
  /// **'expense'**
  String get deleteTransactionExpense;

  /// No description provided for @expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// No description provided for @incomes.
  ///
  /// In en, this message translates to:
  /// **'Incomes'**
  String get incomes;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @myCategories.
  ///
  /// In en, this message translates to:
  /// **'My Categories'**
  String get myCategories;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @myHistory.
  ///
  /// In en, this message translates to:
  /// **'My History'**
  String get myHistory;

  /// No description provided for @expensesToday.
  ///
  /// In en, this message translates to:
  /// **'Expenses today'**
  String get expensesToday;

  /// No description provided for @incomesToday.
  ///
  /// In en, this message translates to:
  /// **'Incomes today'**
  String get incomesToday;

  /// No description provided for @findCategory.
  ///
  /// In en, this message translates to:
  /// **'Find category'**
  String get findCategory;

  /// No description provided for @saveError.
  ///
  /// In en, this message translates to:
  /// **'Error saving'**
  String get saveError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
