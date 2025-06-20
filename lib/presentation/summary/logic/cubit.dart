import 'package:equatable/equatable.dart';
import 'package:finance_fantasy/domain/entities/transaction_extended.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories_impl/api_data_source/transactions_api.dart';
import '../../../domain/entities/status_page.dart';
import '../../../domain/usecases/transactions_by_period.dart';

part 'state.dart';

abstract class BaseSummaryCubit extends Cubit<SummaryState> {
  BaseSummaryCubit()
      : super(
          SummaryState(
            statusPage: StatusPage.loading,
            transactions: [],
          ),
        ) {
    loadData();
  }

  /// TODO: организовать DI
  final GetTransactionsByPeriodUseCase _getTransactionsByPeriodUseCase =
      GetTransactionsByPeriodUseCase(
    TransactionsApiRepository(),
  );

  Future<void> loadData() async {
    emit(state.copyWith(statusPage: StatusPage.loading));
    /// слишком быстро грузятся списки, покрутим лоадер:)
    await Future.delayed(const Duration(seconds: 2));
    final transactions = await _getTransactionsByPeriodUseCase(
      /// TODO: брать параметры из календаря, а accountId из локальной бд
      GetTransactionsByPeriodUseCaseParams(
        accountId: 148,
        from: DateTime(2025, 06, 01),
        to: DateTime(2025, 06, 20),
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

  List<TransactionExtended> filterTransactions(
    List<TransactionExtended> transactions,
  );
}
