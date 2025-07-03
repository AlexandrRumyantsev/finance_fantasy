import 'package:injectable/injectable.dart';

import '../../../../domain/entities/transaction_extended.dart';
import '../cubit.dart';

@injectable
class ExpenseSummaryCubit extends BaseSummaryCubit {
  ExpenseSummaryCubit(super.getTransactionsByPeriodUseCase);

  @override
  List<TransactionExtended> filterTransactions(
    List<TransactionExtended> transactions,
  ) =>
      transactions
          .where((transaction) => !transaction.category.isIncome)
          .toList();
}
