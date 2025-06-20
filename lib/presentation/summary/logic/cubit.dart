import 'package:equatable/equatable.dart';
import 'package:finance_fantasy/domain/entities/transaction_extended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories_impl/api_data_source/transactions_api.dart';
import '../../../domain/entities/status_page.dart';
import '../../../domain/usecases/transactions_by_period.dart';

part 'state.dart';

abstract class BaseSummaryCubit extends Cubit<SummaryState> {
  BaseSummaryCubit() : super(SummaryState()) {
    initState();
    loadData();
  }

  /// TODO: организовать DI
  final GetTransactionsByPeriodUseCase _getTransactionsByPeriodUseCase =
      GetTransactionsByPeriodUseCase(
    TransactionsApiRepository(),
  );

  void initState() {
    final today = DateTime.now();
    final monthAgo = DateTime(today.year, today.month - 1, today.day);
    emit(state.copyWith(
      statusPage: StatusPage.loading,
      transactions: [],
      dateRange: DateTimeRange(start: monthAgo, end: today),
    ));
  }

  Future<void> loadData() async {
    emit(state.copyWith(statusPage: StatusPage.loading));

    /// слишком быстро грузятся списки, покрутим лоадер:)
    await Future.delayed(const Duration(seconds: 2));
    final transactions = await _getTransactionsByPeriodUseCase(
      /// TODO: брать параметры из календаря, а accountId из локальной бд
      GetTransactionsByPeriodUseCaseParams(
        accountId: 148,
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
