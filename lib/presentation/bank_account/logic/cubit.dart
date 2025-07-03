import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/account_brief.dart';
import '../../../domain/entities/status_page.dart';
import '../../../domain/usecases/get_bank_accounts.dart';

part 'state.dart';

@injectable
class BankAccountCubit extends Cubit<BankAccountState> {
  BankAccountCubit(this._getBankAccountsUseCase)
      : super(const BankAccountState());

  final GetBankAccountsUseCase _getBankAccountsUseCase;

  void loadData() {
    _getBankAccounts();
  }

  Future<void> _getBankAccounts() async {
    final result = await _getBankAccountsUseCase.call(null);
    result.fold(
      (error) => emit(state.copyWith(status: StatusPage.error)),
      (bankAccounts) => emit(
        state.copyWith(
          bankAccounts: bankAccounts,
          status: StatusPage.data,
        ),
      ),
    );
  }

  void toggleEditMode() {
    emit(
      state.copyWith(
        pageMode:
            state.pageMode == PageMode.list ? PageMode.edit : PageMode.list,
      ),
    );
  }
}
