import 'package:finance_fantasy/data/mappers/account_brief.dart';
import 'package:finance_fantasy/data/mappers/category.dart';
import 'package:finance_fantasy/data/models/response/transaction_response.dart';
import 'package:finance_fantasy/domain/entities/transaction_short.dart';

import '../../domain/entities/transaction_extended.dart';
import '../models/shared/transaction.dart';

extension TransactionMapping on TransactionExtended {
  TransactionDto toDto() => TransactionDto(
        id: id,
        accountId: account.id,
        categoryId: category.id,
        amount: amount.toString(),
        transactionDate: transactionDate,
        createdAt: createdAt,
        updatedAt: updatedAt,
        comment: comment,
      );
}

extension TransactionResponeMapping on TransactionResponse {
  TransactionExtended toDomain() => TransactionExtended(
        id: id,
        account: account.toDomain(),
        category: category.toDomain(),
        amount: double.parse(amount),
        transactionDate: transactionDate,
        createdAt: createdAt,
        updatedAt: updatedAt,
        comment: comment,
      );
}

extension TransactionDtoMapping on TransactionDto {
  TransactionBrief toDomain() => TransactionBrief(
        id: id,
        accountId: accountId,
        categoryId: categoryId,
        amount: double.parse(amount),
        transactionDate: transactionDate,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
