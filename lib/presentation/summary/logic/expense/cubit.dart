import '../../../../domain/entities/transaction_extended.dart';
import '../cubit.dart';

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
