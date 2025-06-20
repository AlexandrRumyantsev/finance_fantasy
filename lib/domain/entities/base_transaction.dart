abstract class TransactionBase {
  TransactionBase({
    required this.id,
    required this.amount,
    required this.transactionDate,
    required this.createdAt,
    required this.updatedAt,
    this.comment,
  });

  final int id;
  final double amount;
  final DateTime transactionDate;
  final String? comment;
  final DateTime createdAt;
  final DateTime updatedAt;
}
