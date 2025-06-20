import '../../../../domain/entities/status_page.dart';
import '../cubit.dart';

class IncomesSummaryCubit extends BaseSummaryCubit {
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