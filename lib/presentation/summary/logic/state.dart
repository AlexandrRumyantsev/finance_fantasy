part of 'cubit.dart';

/// Состояние страницы сводки доходов\расходов
class SummaryState extends BasePageState with EquatableMixin {
  SummaryState({
    required super.statusPage,
    this.transactions,
  });

  final List<TransactionExtended>? transactions;

  SummaryState copyWith({
    StatusPage? statusPage,
    List<TransactionExtended>? transactions,
  }) =>
      SummaryState(
        statusPage: statusPage ?? this.statusPage,
        transactions: transactions ?? this.transactions,
      );

  double get totalAmount =>
      transactions?.fold(0.0,
          (previousValue, element) => previousValue ?? 0.0 + element.amount) ??
      0.0;

  @override
  List<Object?> get props => [];
}
