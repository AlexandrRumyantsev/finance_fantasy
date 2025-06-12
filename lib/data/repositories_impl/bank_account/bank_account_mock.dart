import 'dart:async';

import 'package:finance_fantasy/data/models/response/account_history_response.dart';

import '../../../domain/entities/error.dart';
import '../../../domain/repositories/bank_account.dart';
import '../../../utils/either.dart';
import '../../models/request/account_create_request.dart';
import '../../models/request/account_update_request.dart';
import '../../models/shared/account.dart';

class MockBankAccountRepository implements BankAccountRepository {
  final List<AccountDto> _accounts = [];
  int _nextId = 1;

  MockBankAccountRepository() {
    _addInitialAccounts();
  }

  void _addInitialAccounts() {
    _accounts.addAll([
      AccountDto(
        id: _nextId++,
        userId: 1,
        name: 'Основной счёт',
        currency: 'RUB',
        balance: '12000.00',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      AccountDto(
        id: _nextId++,
        userId: 1,
        name: 'Копилка',
        currency: 'USD',
        balance: '450.50',
        createdAt: DateTime.now().subtract(const Duration(days: 20)),
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ]);
  }

  @override
  Future<Either<BaseError, List<AccountDto>>> getBankAccounts() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return Right(List.unmodifiable(_accounts));
  }

  @override
  Future<Either<BaseError, AccountDto>> createBankAccount({
    required AccountCreateRequest account,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final newAccount = AccountDto(
      id: _nextId++,
      userId: 1,
      name: account.name,
      currency: account.currency,
      balance: account.balance,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _accounts.add(newAccount);
    return Right(newAccount);
  }

  @override
  Future<Either<BaseError, AccountDto>> updateBankAccount({
    required AccountUpdateRequest account,
    required int accountId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _accounts.indexWhere((acc) => acc.id == accountId);

    if (index == -1) {
      return Left(BaseError(message: 'Счёт с ID $accountId не найден'));
    }

    final existing = _accounts[index];
    final updated = existing.copyWith(
      name: account.name,
      currency: account.currency,
      balance: account.balance,
      updatedAt: DateTime.now(),
    );

    _accounts[index] = updated;
    return Right(updated);
  }

  @override
  Future<Either<BaseError, AccountDto>> getBankAccountById({
    required int accountId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final matches = _accounts.where((acc) => acc.id == accountId);

    if (matches.isEmpty) {
      return Left(BaseError(message: 'Счёт с ID $accountId не найден'));
    }

    return Right(matches.first);
  }

  @override
  Future<Either<BaseError, AccountHistoryResponse>> getAccountHistory({
    required int accountId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final matches = _accounts.where((acc) => acc.id == accountId);

    if (matches.isEmpty) {
      return Left(BaseError(message: 'Счёт с ID $accountId не найден'));
    }

    return Right(
      AccountHistoryResponse(
        accountId: accountId,
        accountName: matches.first.name,
        currency: matches.first.currency,
        history: [],
        currentBalance: matches.first.balance,
      ),
    );
  }
}
