import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/injection.dart';
import '../../domain/usecases/transactions_by_period.dart';
import '../history/history.dart';
import 'logic/cubit.dart';
import 'logic/expense/cubit.dart';
import 'logic/incomes/cubit.dart';
import 'summary.dart';

class SummaryTabNavigator<C extends BaseSummaryCubit> extends StatelessWidget {
  const SummaryTabNavigator({
    super.key,
    required this.isExpense,
  });

  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == '/history') {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => isExpense
                  ? ExpenseSummaryCubit(
                      getIt<GetTransactionsByPeriodUseCase>(),
                    )
                  : IncomesSummaryCubit(
                      getIt<GetTransactionsByPeriodUseCase>(),
                    ),
              child: HistoryPage<C>(),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => isExpense
                ? ExpenseSummaryCubit(
                    getIt<GetTransactionsByPeriodUseCase>(),
                  )
                : IncomesSummaryCubit(
                    getIt<GetTransactionsByPeriodUseCase>(),
                  ),
            child: SummaryPage<C>(
              title: isExpense ? 'Расходы сегодня' : 'Доходы сегодня',
              onSuffixPressed: () {
                Navigator.of(context).pushNamed('/history');
              },
            ),
          ),
        );
      },
    );
  }
}
