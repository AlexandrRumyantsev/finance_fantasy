import 'dart:async';

import 'package:finance_fantasy/data/models/request/transaction_request.dart';

import 'package:finance_fantasy/data/models/response/transaction_response.dart';

import 'package:finance_fantasy/domain/entities/error.dart';

import 'package:finance_fantasy/utils/either.dart';

import '../../../domain/repositories/transactions.dart';
import '../../models/shared/transaction.dart';
import '../bank_account/bank_account_mock.dart';
import '../categories/categories_mock.dart';

class MockTransactionRepository implements TransactionRepository {
  MockTransactionRepository(this._accountRepo, this._categoryRepo);

  final MockBankAccountRepository _accountRepo;
  final MockCategoriesRepository _categoryRepo;

  final List<TransactionDto> _transactions = [];

  @override
  Future<Either<BaseError, TransactionDto>> createTransaction(
    TransactionRequest transaction,
  ) async {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteTransaction({
    required int transactionId,
  }) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, TransactionResponse>> getTransactionById({
    required int transactionId,
  }) {
    // TODO: implement getTransactionById
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, TransactionResponse>> updateTransaction({
    required TransactionRequest transaction,
  }) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<TransactionResponse>>> getTransactionsByPeriod({
    required int accountId,
    DateTime? from,
    DateTime? to,
  }) {
    // TODO: implement getTransactionsByPeriod
    throw UnimplementedError();
  }
}
