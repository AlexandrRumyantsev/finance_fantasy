import 'package:finance_fantasy/data/mappers/category.dart';
import 'package:finance_fantasy/data/models/shared/account_brief.dart';
import 'package:finance_fantasy/utils/list.dart';

import '../../../domain/entities/error.dart';
import '../../../domain/repositories/transactions.dart';
import '../../../utils/either.dart';
import '../../models/request/transaction_request.dart';
import '../../models/response/transaction_response.dart';
import '../../models/shared/transaction.dart';
import '../bank_account/bank_account_mock.dart';
import '../categories/categories_mock.dart';

class MockTransactionRepository implements TransactionRepository {
  MockTransactionRepository(this._accountRepo, this._categoryRepo);

  final MockBankAccountRepository _accountRepo;
  final MockCategoriesRepository _categoryRepo;

  final List<TransactionDto> _transactions = [];
  int _nextId = 1;

  @override
  Future<Either<BaseError, TransactionDto>> createTransaction(
    TransactionRequest transaction,
  ) async {
    final now = DateTime.now();
    final newTransaction = TransactionDto(
      id: _nextId++,
      accountId: transaction.accountId,
      categoryId: transaction.categoryId,
      amount: transaction.amount,
      transactionDate: transaction.transactionDate,
      createdAt: now,
      updatedAt: now,
      comment: transaction.comment,
    );
    _transactions.add(newTransaction);
    return Right(newTransaction);
  }

  @override
  Future<Either<BaseError, bool>> deleteTransaction({
    required int transactionId,
  }) async {
    final index = _transactions.indexWhere((t) => t.id == transactionId);
    if (index == -1) {
      return Left(BaseError(message: 'Transaction not found'));
    }
    _transactions.removeAt(index);
    return const Right(true);
  }

  @override
  Future<Either<BaseError, TransactionResponse>> getTransactionById({
    required int transactionId,
  }) async {
    TransactionDto? transaction;
    try {
      transaction = _transactions.firstWhere((t) => t.id == transactionId);
    } catch (_) {
      return Left(BaseError(message: 'Transaction not found'));
    }

    return _buildTransactionResponse(transaction);
  }

  @override
  Future<Either<BaseError, TransactionResponse>> updateTransaction({
    required TransactionRequest transaction,
    required int transactionId,
  }) async {
    final index = _transactions.indexWhere((t) => t.id == transactionId);
    if (index == -1) {
      return Left(BaseError(message: 'Transaction not found'));
    }

    final old = _transactions[index];
    final updated = old.copyWith(
      amount: transaction.amount,
      transactionDate: transaction.transactionDate,
      categoryId: transaction.categoryId,
      accountId: transaction.accountId,
      updatedAt: DateTime.now(),
      comment: transaction.comment,
    );

    _transactions[index] = updated;

    return _buildTransactionResponse(updated);
  }

  @override
  Future<Either<BaseError, List<TransactionResponse>>> getTransactionsByPeriod({
    required int accountId,
    DateTime? from,
    DateTime? to,
  }) async {
    final filtered = _transactions.where((t) {
      final matchAccount = t.accountId == accountId;
      final matchFrom = from == null ||
          t.transactionDate.isAfter(from.subtract(const Duration(days: 1)));
      final matchTo = to == null ||
          t.transactionDate.isBefore(to.add(const Duration(days: 1)));
      return matchAccount && matchFrom && matchTo;
    }).toList();

    final responses = <TransactionResponse>[];

    for (final t in filtered) {
      final response = await _buildTransactionResponse(t);

      response.fold(
        (error) {},
        (value) {
          responses.add(value);
        },
      );
    }

    return Right(responses);
  }

  Future<Either<BaseError, TransactionResponse>> _buildTransactionResponse(
    TransactionDto transaction,
  ) async {
    final accountResult =
        await _accountRepo.getBankAccountById(accountId: transaction.accountId);
    final categoryResult = await _categoryRepo.getCategories();

    if (accountResult.isLeft) {
      return Left(accountResult.asLeft?.value ?? BaseError.unknown());
    }

    if (categoryResult.isLeft) {
      return Left(categoryResult.asLeft?.value ?? BaseError.unknown());
    }

    final category = categoryResult.asRight?.value
        .firstWhereOrNull((c) => c.id == transaction.categoryId);

    if (category == null) {
      return Left(BaseError(message: 'Category not found'));
    }

    final account = accountResult.asRight;

    if (account == null) {
      return Left(BaseError(message: 'Account not found'));
    }

    final name = account.value.name;
    final currency = account.value.currency;
    final balance = account.value.balance;

    return Right(TransactionResponse(
      id: transaction.id,
      account: AccountBriefDto(
        id: transaction.accountId,
        name: name,
        currency: currency,
        balance: balance,
      ),
      category: category.toDto(),
      amount: transaction.amount,
      transactionDate: transaction.transactionDate,
      createdAt: transaction.createdAt,
      updatedAt: transaction.updatedAt,
      comment: transaction.comment,
    ));
  }
}
