part of 'cubit.dart';

/// Состояние страницы сводки доходов\расходов
class SummaryState with EquatableMixin {
  const SummaryState({
    this.statusPage = StatusPage.loading,
    this.transactions,
    this.dateRange,
  });

  final StatusPage statusPage;

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

  final List<TransactionExtended>? transactions;

  double get totalAmount =>
      transactions?.fold<double>(0, (prev, e) => prev + e.amount) ?? 0;

  @override
  List<Object?> get props => [
        statusPage,
        transactions,
        dateRange,
      ];
}
