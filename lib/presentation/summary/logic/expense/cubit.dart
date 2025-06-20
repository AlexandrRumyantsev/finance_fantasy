import 'package:finance_fantasy/presentation/summary/logic/cubit.dart';

import '../../../../domain/entities/status_page.dart';

class ExpenseSummaryCubit extends BaseSummaryCubit {
  ExpenseSummaryCubit() : super();

  @override
  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    if (state.transactions?.isNotEmpty ?? false) {
      emit(state.copyWith(statusPage: StatusPage.data));
    } else {
      emit(state.copyWith(statusPage: StatusPage.empty));
    }
  }
}