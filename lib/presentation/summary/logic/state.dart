part of 'cubit.dart';

/// Состояние страницы сводки доходов\расходов
class SummaryState with EquatableMixin {
  SummaryState({
    this.statusPage = StatusPage.loading,
    this.transactions,
    this.dateRange,
  });

  final StatusPage statusPage;
  final List<TransactionExtended>? transactions;
  final DateTimeRange? dateRange;

  SummaryState copyWith({
    StatusPage? statusPage,
    List<TransactionExtended>? transactions,
    DateTimeRange? dateRange,
  }) =>
      SummaryState(
        statusPage: statusPage ?? this.statusPage,
        transactions: transactions ?? this.transactions,
        dateRange: dateRange ?? this.dateRange,
      );

  double get totalAmount =>
      transactions?.fold(0.0, (prev, e) => prev! + e.amount) ?? 0.0;

  @override
  List<Object?> get props => [
        statusPage,
        transactions,
        dateRange,
      ];
}
