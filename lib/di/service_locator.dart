import 'package:get_it/get_it.dart';
import '../domain/repositories/bank_account.dart';
import '../domain/repositories/categories.dart';
import '../domain/repositories/transactions.dart';

class ServiceLocator {
  static final GetIt _getIt = GetIt.instance;

  static TransactionRepository get transactionRepository =>
      _getIt<TransactionRepository>();

  static BankAccountRepository get bankAccountRepository =>
      _getIt<BankAccountRepository>();

  static CategoriesRepository get categoriesRepository =>
      _getIt<CategoriesRepository>();
}
