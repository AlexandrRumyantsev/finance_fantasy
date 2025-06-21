import 'account_brief.dart';

import 'base_transaction.dart';
import 'category.dart';

class TransactionExtended extends TransactionBase {
  TransactionExtended({
    required super.id,
    required super.amount,
    required super.transactionDate,
    required super.createdAt,
    required super.updatedAt,
    required this.account,
    required this.category,
    super.comment,
  });

  final AccountBrief account;
  final Category category;
}
