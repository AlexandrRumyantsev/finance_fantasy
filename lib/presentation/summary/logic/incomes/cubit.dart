import 'package:finance_fantasy/domain/entities/category.dart';
import 'package:finance_fantasy/domain/entities/transaction_extended.dart';

import '../../../../domain/entities/account_brief.dart';
import '../../../../domain/entities/status_page.dart';
import '../cubit.dart';

class IncomesSummaryCubit extends BaseSummaryCubit {
  @override
  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(statusPage: StatusPage.data, transactions: [
      TransactionExtended(
        id: 0,
        amount: 1000000,
        transactionDate: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        account: AccountBrief(name: 'Cash', currency: 'USD', balance: 123214124, id: 0),
        category: Category(id: 0, name: 'Дом', emoji: '🏠', isIncome: true),
      )
    ]));
  }
}
