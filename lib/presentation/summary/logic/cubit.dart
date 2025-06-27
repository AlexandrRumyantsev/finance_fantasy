import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/status_page.dart';
import '../../../domain/entities/transaction_extended.dart';
import '../../../domain/usecases/transactions_by_period.dart';

part 'state.dart';

abstract class BaseSummaryCubit extends Cubit<SummaryState> {
  BaseSummaryCubit(this._getTransactionsByPeriodUseCase)
      : super(const SummaryState());

  /// TODO: организовать DI
  final GetTransactionsByPeriodUseCase _getTransactionsByPeriodUseCase;

  void initState({DateTimeRange? dateRange}) {
    final today = DateTime.now();
    emit(
      state.copyWith(
        statusPage: StatusPage.loading,
        transactions: [],
        dateRange: dateRange ?? DateTimeRange(start: today, end: today),
      ),
    );
  }

  void setDateRange({
    DateTime? from,
    DateTime? to,
  }) {
    final currentRange = state.dateRange ??
        DateTimeRange(start: DateTime.now(), end: DateTime.now());
    final start = from ?? currentRange.start;
    final end = to ?? currentRange.end;

    DateTimeRange newRange;
    if (start.isAfter(end)) {
      newRange = DateTimeRange(start: end, end: start);
    } else {
      newRange = DateTimeRange(start: start, end: end);
    }
    emit(state.copyWith(dateRange: newRange));
    loadData();
  }

  Future<void> loadData() async {
    emit(state.copyWith(statusPage: StatusPage.loading));
    final transactions = await _getTransactionsByPeriodUseCase(
      GetTransactionsByPeriodUseCaseParams(
        from: state.dateRange?.start,
        to: state.dateRange?.end,
      ),
    );
    transactions.fold(
      (error) => emit(state.copyWith(statusPage: StatusPage.error)),
      (transactions) {
        final filteredTransactions = filterTransactions(transactions);
        emit(
          state.copyWith(
            statusPage: filteredTransactions.isEmpty
                ? StatusPage.empty
                : StatusPage.data,
            transactions: filteredTransactions,
          ),
        );
      },
    );
  }

  void updateSelectedPeriod(DateTimeRange range) {
    emit(state.copyWith(dateRange: range));
    loadData();
  }

  List<TransactionExtended> filterTransactions(
    List<TransactionExtended> transactions,
  );
}
