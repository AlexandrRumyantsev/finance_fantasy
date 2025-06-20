import 'package:finance_fantasy/domain/entities/account_brief.dart';

import 'base_transaction.dart';
import 'category.dart';

class TransactionExtended extends TransactionBase {
  TransactionExtended({
    required super.id,
    required super.amount,
    required super.transactionDate,
    required super.createdAt,
    required super.updatedAt,
    super.comment,
    required this.account,
    required this.category,
  });

  final AccountBrief account;
  final Category category;
}
