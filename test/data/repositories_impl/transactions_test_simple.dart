import 'package:finance_fantasy/data/data_source/rest/api_service_interface.dart';
import 'package:finance_fantasy/data/models/request/transaction_request.dart';
import 'package:finance_fantasy/data/models/response/transaction_response.dart';
import 'package:finance_fantasy/data/models/shared/account_brief.dart';
import 'package:finance_fantasy/data/models/shared/category.dart';
import 'package:finance_fantasy/data/models/shared/transaction.dart';
import 'package:finance_fantasy/data/repositories_impl/transactions.dart';
import 'package:finance_fantasy/domain/entities/transaction_params.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transactions_test_simple.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late TransactionRepositoryImpl repository;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    repository = TransactionRepositoryImpl(mockApiService);
  });

  group('TransactionRepositoryImpl', () {
    final testDate = DateTime(2024, 1, 15);

    final testTransactionParams = TransactionParams(
      accountId: 1,
      categoryId: 2,
      amount: 100.50,
      transactionDate: testDate,
      comment: 'Test transaction',
    );

    final testTransactionDto = TransactionDto(
      id: 1,
      accountId: 1,
      categoryId: 2,
      amount: '100.5',
      transactionDate: testDate,
      createdAt: testDate,
      updatedAt: testDate,
      comment: 'Test transaction',
    );

    const testAccountBrief = AccountBriefDto(
      id: 1,
      name: 'Test Account',
      currency: 'USD',
      balance: '1000.0',
    );

    const testCategory = CategoryDto(
      id: 2,
      name: 'Test Category',
      emoji: '💰',
      isIncome: false,
    );

    final testTransactionResponse = TransactionResponse(
      id: 1,
      account: testAccountBrief,
      category: testCategory,
      amount: '100.5',
      transactionDate: testDate,
      createdAt: testDate,
      updatedAt: testDate,
      comment: 'Test transaction',
    );

    group('createTransaction', () {
      test('should create transaction successfully', () async {
        // Arrange
        when(mockApiService
                .createTransaction(argThat(isA<TransactionRequest>())))
            .thenAnswer((_) async => testTransactionDto);

        // Act
        final result = await repository.createTransaction(
          transaction: testTransactionParams,
        );

        // Assert
        expect(result.isRight, true);
        result.fold(
          (error) => fail('Expected Right but got Left: ${error.message}'),
          (transaction) {
            expect(transaction.id, 1);
            expect(transaction.accountId, 1);
            expect(transaction.categoryId, 2);
            expect(transaction.amount, 100.5);
            expect(transaction.comment, 'Test transaction');
          },
        );
      });

      test('should return error when API throws exception', () async {
        // Arrange
        when(mockApiService
                .createTransaction(argThat(isA<TransactionRequest>())))
            .thenThrow(Exception('Network error'));

        // Act
        final result = await repository.createTransaction(
          transaction: testTransactionParams,
        );

        // Assert
        expect(result.isLeft, true);
        result.fold(
          (error) => expect(error.message, contains('Network error')),
          (transaction) => fail('Expected Left but got Right'),
        );
      });
    });

    group('updateTransaction', () {
      test('should update transaction successfully', () async {
        // Arrange
        const transactionId = 1;
        when(
          mockApiService.updateTransaction(
            transactionId,
            TransactionRequest(
              accountId: 1,
              categoryId: 2,
              amount: '100.5',
              transactionDate: testDate,
              comment: 'Test transaction',
            ),
          ),
        ).thenAnswer((_) async => testTransactionResponse);

        // Act
        final result = await repository.updateTransaction(
          transaction: testTransactionParams,
          transactionId: transactionId,
        );

        // Assert
        expect(result.isRight, true);
        result.fold(
          (error) => fail('Expected Right but got Left: ${error.message}'),
          (transaction) {
            expect(transaction.id, 1);
            expect(transaction.amount, 100.5);
            expect(transaction.comment, 'Test transaction');
            expect(transaction.account.id, 1);
            expect(transaction.category.id, 2);
          },
        );
      });

      test('should return error when update fails', () async {
        // Arrange
        const transactionId = 1;
        when(
          mockApiService.updateTransaction(
            transactionId,
            TransactionRequest(
              accountId: 1,
              categoryId: 2,
              amount: '100.5',
              transactionDate: testDate,
              comment: 'Test transaction',
            ),
          ),
        ).thenThrow(Exception('Update failed'));

        // Act
        final result = await repository.updateTransaction(
          transaction: testTransactionParams,
          transactionId: transactionId,
        );

        // Assert
        expect(result.isLeft, true);
        result.fold(
          (error) => expect(error.message, contains('Update failed')),
          (transaction) => fail('Expected Left but got Right'),
        );
      });
    });

    group('deleteTransaction', () {
      test('should delete transaction successfully', () async {
        // Arrange
        const transactionId = 1;
        when(mockApiService.deleteTransaction(transactionId))
            .thenAnswer((_) async {});

        // Act
        final result = await repository.deleteTransaction(
          transactionId: transactionId,
        );

        // Assert
        expect(result.isRight, true);
        result.fold(
          (error) => fail('Expected Right but got Left: ${error.message}'),
          (success) => expect(success, true),
        );

        verify(mockApiService.deleteTransaction(transactionId)).called(1);
      });

      test('should return error when delete fails', () async {
        // Arrange
        const transactionId = 1;
        when(mockApiService.deleteTransaction(transactionId))
            .thenThrow(Exception('Delete failed'));

        // Act
        final result = await repository.deleteTransaction(
          transactionId: transactionId,
        );

        // Assert
        expect(result.isLeft, true);
        result.fold(
          (error) => expect(error.message, contains('Delete failed')),
          (success) => fail('Expected Left but got Right'),
        );
      });
    });

    group('getTransactionById', () {
      test('should get transaction by id successfully', () async {
        // Arrange
        const transactionId = 1;
        when(mockApiService.getTransactionById(transactionId))
            .thenAnswer((_) async => testTransactionResponse);

        // Act
        final result = await repository.getTransactionById(
          transactionId: transactionId,
        );

        // Assert
        expect(result.isRight, true);
        result.fold(
          (error) => fail('Expected Right but got Left: ${error.message}'),
          (transaction) {
            expect(transaction.id, 1);
            expect(transaction.amount, 100.5);
            expect(transaction.account.name, 'Test Account');
            expect(transaction.category.name, 'Test Category');
          },
        );

        verify(mockApiService.getTransactionById(transactionId)).called(1);
      });

      test('should return error when get by id fails', () async {
        // Arrange
        const transactionId = 1;
        when(mockApiService.getTransactionById(transactionId))
            .thenThrow(Exception('Transaction not found'));

        // Act
        final result = await repository.getTransactionById(
          transactionId: transactionId,
        );

        // Assert
        expect(result.isLeft, true);
        result.fold(
          (error) => expect(error.message, contains('Transaction not found')),
          (transaction) => fail('Expected Left but got Right'),
        );
      });
    });

    group('getTransactionsByPeriod', () {
      test('should get transactions by period with dates successfully',
          () async {
        // Arrange
        const accountId = 1;
        final fromDate = DateTime(2024, 1, 1);
        final toDate = DateTime(2024, 1, 31);
        final transactions = [testTransactionResponse];

        when(
          mockApiService.getTransactionsByPeriod(
            accountId,
            '2024-01-01',
            '2024-01-31',
          ),
        ).thenAnswer((_) async => transactions);

        // Act
        final result = await repository.getTransactionsByPeriod(
          accountId: accountId,
          from: fromDate,
          to: toDate,
        );

        // Assert
        expect(result.isRight, true);
        result.fold(
          (error) => fail('Expected Right but got Left: ${error.message}'),
          (transactionList) {
            expect(transactionList.length, 1);
            expect(transactionList.first.id, 1);
            expect(transactionList.first.amount, 100.5);
          },
        );

        verify(
          mockApiService.getTransactionsByPeriod(
            accountId,
            '2024-01-01',
            '2024-01-31',
          ),
        ).called(1);
      });

      test('should get transactions by period without dates successfully',
          () async {
        // Arrange
        const accountId = 1;
        final transactions = [testTransactionResponse];

        when(
          mockApiService.getTransactionsByPeriod(
            accountId,
            null,
            null,
          ),
        ).thenAnswer((_) async => transactions);

        // Act
        final result = await repository.getTransactionsByPeriod(
          accountId: accountId,
        );

        // Assert
        expect(result.isRight, true);
        result.fold(
          (error) => fail('Expected Right but got Left: ${error.message}'),
          (transactionList) => expect(transactionList.length, 1),
        );

        verify(
          mockApiService.getTransactionsByPeriod(
            accountId,
            null,
            null,
          ),
        ).called(1);
      });

      test('should return error when get by period fails', () async {
        // Arrange
        const accountId = 1;
        when(
          mockApiService.getTransactionsByPeriod(
            accountId,
            null,
            null,
          ),
        ).thenThrow(Exception('Failed to get transactions'));

        // Act
        final result = await repository.getTransactionsByPeriod(
          accountId: accountId,
        );

        // Assert
        expect(result.isLeft, true);
        result.fold(
          (error) =>
              expect(error.message, contains('Failed to get transactions')),
          (transactions) => fail('Expected Left but got Right'),
        );
      });

      test('should return empty list when no transactions found', () async {
        // Arrange
        const accountId = 1;
        when(
          mockApiService.getTransactionsByPeriod(
            accountId,
            null,
            null,
          ),
        ).thenAnswer((_) async => []);

        // Act
        final result = await repository.getTransactionsByPeriod(
          accountId: accountId,
        );

        // Assert
        expect(result.isRight, true);
        result.fold(
          (error) => fail('Expected Right but got Left: ${error.message}'),
          (transactions) => expect(transactions.isEmpty, true),
        );
      });
    });

    group('date formatting tests', () {
      test('should format dates correctly for API calls', () async {
        // Arrange
        const accountId = 1;
        final fromDate = DateTime(2024, 12, 25);
        final toDate = DateTime(2024, 12, 31);

        when(
          mockApiService.getTransactionsByPeriod(
            accountId,
            '2024-12-25',
            '2024-12-31',
          ),
        ).thenAnswer((_) async => []);

        // Act
        await repository.getTransactionsByPeriod(
          accountId: accountId,
          from: fromDate,
          to: toDate,
        );

        // Assert
        verify(
          mockApiService.getTransactionsByPeriod(
            accountId,
            '2024-12-25',
            '2024-12-31',
          ),
        ).called(1);
      });
    });
  });
}
