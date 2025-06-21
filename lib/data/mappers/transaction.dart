import '../../domain/entities/transaction_extended.dart';
import '../../domain/entities/transaction_short.dart';
import '../models/response/transaction_response.dart';
import '../models/shared/transaction.dart';
import 'account_brief.dart';
import 'category.dart';

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
