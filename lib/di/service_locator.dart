import 'package:get_it/get_it.dart';
import '../domain/usecases/transactions_by_period.dart';
import '../infrastructure/managers/shared_prefs.dart';

class ServiceLocator {
  static final GetIt _getIt = GetIt.instance;
  static SharedPrefsManager get sharedPrefsManager =>
      _getIt<SharedPrefsManager>();    

  static GetTransactionsByPeriodUseCase get getTransactionsByPeriodUseCase =>
      _getIt<GetTransactionsByPeriodUseCase>();
}
