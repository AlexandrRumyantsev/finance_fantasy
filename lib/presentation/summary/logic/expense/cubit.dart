import 'package:finance_fantasy/presentation/summary/logic/cubit.dart';

import '../../../../domain/entities/transaction_extended.dart';

class ExpenseSummaryCubit extends BaseSummaryCubit {
  ExpenseSummaryCubit() : super();

  @override
  List<TransactionExtended> filterTransactions(
          List<TransactionExtended> transactions) =>
      transactions
          .where((transaction) => !transaction.category.isIncome)
          .toList();
}
