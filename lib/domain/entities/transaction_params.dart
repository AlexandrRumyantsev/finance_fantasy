class TransactionParams {
  const TransactionParams({
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.transactionDate,
    this.comment,
  });

  final int accountId;
  final int categoryId;
  final double amount;
  final DateTime transactionDate;
  final String? comment;
}
