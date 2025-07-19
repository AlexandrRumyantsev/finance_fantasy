// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Finance Fantasy';

  @override
  String get appSubtitle => 'Управляйте своими финансами';

  @override
  String get settings => 'Настройки';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get security => 'Безопасность';

  @override
  String get interface => 'Интерфейс';

  @override
  String get theme => 'Тема';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Темная';

  @override
  String get themeSystem => 'Системная';

  @override
  String get selectTheme => 'Выберите тему';

  @override
  String get primaryColor => 'Основной цвет';

  @override
  String get primaryColorDescription => 'Выберите цвет приложения';

  @override
  String get selectColor => 'Выберите цвет';

  @override
  String get done => 'Готово';

  @override
  String get pinCode => 'PIN-код';

  @override
  String get pinCodeDescription => 'Защита приложения';

  @override
  String get pinCodeSet => 'PIN-код установлен';

  @override
  String get pinCodeSetup => 'Установка PIN-кода';

  @override
  String get enterPinCode => 'Введите PIN-код';

  @override
  String get createPinCode => 'Создайте PIN-код';

  @override
  String get confirmPinCode => 'Подтвердите PIN-код';

  @override
  String get enterPinCodeDescription => 'Введите 4-значный PIN-код для входа в приложение';

  @override
  String get createPinCodeDescription => 'Введите 4-значный PIN-код для защиты приложения';

  @override
  String get confirmPinCodeDescription => 'Повторите введенный PIN-код';

  @override
  String get pinCodeSetSuccess => 'PIN-код установлен';

  @override
  String get disablePinCode => 'Отключить PIN-код';

  @override
  String get disablePinCodeConfirm => 'Вы уверены, что хотите отключить PIN-код? Приложение больше не будет требовать ввода PIN-кода при запуске.';

  @override
  String get pinCodeDisabled => 'PIN-код отключен';

  @override
  String get forgotPinCode => 'Забыли PIN-код?';

  @override
  String get resetPinCode => 'Сброс PIN-кода';

  @override
  String get resetPinCodeDescription => 'Для сброса PIN-кода необходимо переустановить приложение. Все данные будут удалены.';

  @override
  String get reset => 'Сбросить';

  @override
  String get biometric => 'Биометрия';

  @override
  String get biometricDescription => 'Face ID / Touch ID';

  @override
  String get confirmIdentity => 'Подтвердите вашу личность';

  @override
  String get haptic => 'Хаптики';

  @override
  String get hapticDescription => 'Тактильная обратная связь';

  @override
  String get language => 'Язык';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get russian => 'Русский';

  @override
  String get english => 'English';

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get total => 'Всего';

  @override
  String get amount => 'Сумма';

  @override
  String get date => 'Дата';

  @override
  String get comment => 'Комментарий';

  @override
  String get category => 'Категория';

  @override
  String get selectCategory => 'Выберите категорию';

  @override
  String get noCategoriesAvailable => 'Нет доступных категорий';

  @override
  String get start => 'Начало';

  @override
  String get end => 'Конец';

  @override
  String deleteTransaction(Object type) {
    return 'Удалить $type';
  }

  @override
  String get deleteTransactionIncome => 'доход';

  @override
  String get deleteTransactionExpense => 'расход';

  @override
  String get expenses => 'Расходы';

  @override
  String get incomes => 'Доходы';

  @override
  String get account => 'Счет';

  @override
  String get categories => 'Статьи';

  @override
  String get myCategories => 'Мои статьи';

  @override
  String get myAccount => 'Мой счет';

  @override
  String get myHistory => 'Моя история';

  @override
  String get expensesToday => 'Расходы сегодня';

  @override
  String get incomesToday => 'Доходы сегодня';

  @override
  String get findCategory => 'Найти статью';

  @override
  String get saveError => 'Ошибка при сохранении';
}
