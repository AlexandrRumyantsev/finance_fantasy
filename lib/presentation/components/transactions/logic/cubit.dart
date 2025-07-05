import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/account_brief.dart';
import '../../../../domain/entities/category.dart';
import '../../../../domain/entities/transaction_extended.dart';
import '../../../../domain/entities/transaction_params.dart';
import '../../../../domain/usecases/transactions/create_transaction.dart';
import '../../../../domain/usecases/transactions/delete_transaction.dart';
import '../../../../domain/usecases/transactions/update_transaction.dart';

part 'state.dart';

@injectable
class TransactionEditCubit extends Cubit<TransactionEditState> {
  TransactionEditCubit(
    this._createTransactionUseCase,
    this._updateTransactionUseCase,
    this._deleteTransactionUseCase,
  ) : super(const TransactionEditState());

  final CreateTransactionUseCase _createTransactionUseCase;
  final UpdateTransactionUseCase _updateTransactionUseCase;
  final DeleteTransactionUseCase _deleteTransactionUseCase;

  void initState(TransactionEditState initialState) {
    emit(initialState);
  }

  void updateAmount(double? amount) {
    emit(
      state.copyWith(
        amount: amount,
      ),
    );
  }

  void updateCategory(Category? category) {
    emit(
      state.copyWith(
        category: category,
      ),
    );
  }

  void updateAccount(AccountBrief? account) {
    emit(
      state.copyWith(
        account: account,
      ),
    );
  }

  void updateDate(DateTime date) {
    final newDateTime = state.combineWithDate(date);
    if (newDateTime != null) {
      emit(
        state.copyWith(
          transactionDate: newDateTime,
        ),
      );
    }
  }

  void updateTime(TimeOfDay time) {
    final newDateTime = state.combineWithTime(time);
    if (newDateTime != null) {
      emit(
        state.copyWith(
          transactionDate: newDateTime,
        ),
      );
    }
  }

  void updateDateTime(DateTime dateTime) {
    emit(
      state.copyWith(
        transactionDate: dateTime,
      ),
    );
  }

  void updateComment(String? comment) {
    emit(
      state.copyWith(
        comment: comment,
      ),
    );
  }

  bool validateBeforeSave() {
    final isValid = state.account != null &&
        state.category != null &&
        state.amount != null &&
        state.transactionDate != null;
    return isValid;
  }

  Future<bool> delete() async {
    final result = await _deleteTransactionUseCase.call(state.transactionId!);
    return result.fold(
      (error) => false,
      (transaction) => true,
    );
  }

  Future<bool> save() async {
    if (!validateBeforeSave()) return false;

    if (state.isNewTransaction) {
      final params = TransactionParams(
        accountId: state.account!.id,
        categoryId: state.category!.id,
        amount: state.amount!,
        transactionDate: state.transactionDate!,
        comment: state.comment,
      );
      final result = await _createTransactionUseCase.call(params);
      return result.fold(
        (error) => false,
        (transaction) => true,
      );
    } else {
      final params = TransactionParams(
        accountId: state.account!.id,
        categoryId: state.category!.id,
        amount: state.amount!,
        transactionDate: state.transactionDate!,
        comment: state.comment,
      );
      final result =
          await _updateTransactionUseCase.call((params, state.transactionId!));
      return result.fold(
        (error) => false,
        (transaction) => true,
      );
    }
  }
}
