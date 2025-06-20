import 'base_transaction.dart';

class TransactionBrief extends TransactionBase {
  TransactionBrief({
    required super.id,
    required super.amount,
    required super.transactionDate,
    required super.createdAt,
    required super.updatedAt,
    super.comment,
    required this.accountId,
    required this.categoryId,
  });

  final int accountId;
  final int categoryId;
}
