part of 'cubit.dart';

class TransactionEditState extends Equatable {
  const TransactionEditState({
    this.transactionId,
    this.account,
    this.category,
    this.amount,
    this.transactionDate,
    this.comment,
  });

  final int? transactionId;
  final AccountBrief? account;
  final Category? category;
  final double? amount;
  final DateTime? transactionDate;
  final String? comment;

  TransactionEditState copyWith({
    int? transactionId,
    AccountBrief? account,
    Category? category,
    double? amount,
    DateTime? transactionDate,
    String? comment,
  }) {
    return TransactionEditState(
      transactionId: transactionId ?? this.transactionId,
      account: account ?? this.account,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      comment: comment ?? this.comment,
    );
  }

  @override
  List<Object?> get props => [
        transactionId,
        account,
        category,
        amount,
        transactionDate,
        comment,
      ];

  factory TransactionEditState.fromTransaction(
    TransactionExtended transaction,
  ) {
    return TransactionEditState(
      transactionId: transaction.id,
      account: transaction.account,
      category: transaction.category,
      amount: transaction.amount,
      transactionDate: transaction.transactionDate,
      comment: transaction.comment,
    );
  }

  factory TransactionEditState.empty() {
    return const TransactionEditState();
  }

  bool get isNewTransaction => transactionId == null;

  DateTime? get dateOnly {
    final date = transactionDate;
    if (date == null) return null;
    return DateTime(
      date.year,
      date.month,
      date.day,
    );
  }

  TimeOfDay? get timeOfDay {
    final date = transactionDate;
    if (date == null) return null;
    return TimeOfDay(
      hour: date.hour,
      minute: date.minute,
    );
  }

  DateTime? combineWithTime(TimeOfDay time) {
    final date = transactionDate;
    if (date == null) return null;
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  DateTime? combineWithDate(DateTime date) {
    final currentDate = transactionDate;
    if (currentDate == null) return date;
    return DateTime(
      date.year,
      date.month,
      date.day,
      currentDate.hour,
      currentDate.minute,
    );
  }
}
