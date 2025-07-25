import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:finance_fantasy/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Transaction Flow Integration Tests', () {
    testWidgets('Complete transaction management flow',
        (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for the app to fully load
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Test adding a new transaction
      await _testAddTransaction(tester);

      // Test editing the transaction
      await _testEditTransaction(tester);

      // Test deleting the transaction
      await _testDeleteTransaction(tester);
    });

    testWidgets('Transaction category selection flow',
        (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      await _testCategorySelection(tester);
    });

    testWidgets('Transaction account selection flow',
        (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      await _testAccountSelection(tester);
    });
  });
}

Future<void> _testAddTransaction(WidgetTester tester) async {
  // Navigate to summary page if not already there
  final summaryTab = find.text('Сводка');
  if (summaryTab.evaluate().isNotEmpty) {
    await tester.tap(summaryTab.first);
    await tester.pumpAndSettle();
  }

  // Look for the floating action button to add a transaction
  final addButton = find.byType(FloatingActionButton);
  expect(addButton, findsOneWidget,
      reason: 'Should find FloatingActionButton for adding transactions');

  await tester.tap(addButton);
  await tester.pumpAndSettle();

  // Verify the transaction edit modal appears
  expect(find.text('Добавить транзакцию'), findsOneWidget);

  // Test filling in transaction details
  await _fillTransactionForm(tester, isNewTransaction: true);

  // Save the transaction
  final saveButton = find.text('Сохранить');
  expect(saveButton, findsOneWidget);
  await tester.tap(saveButton);
  await tester.pumpAndSettle();

  // Verify we're back to the summary page
  expect(find.text('Сводка'), findsWidgets);
}

Future<void> _testEditTransaction(WidgetTester tester) async {
  // Find a transaction in the list to edit
  // This assumes there are transactions visible
  final transactionItem = find.byType(ListTile).first;
  if (transactionItem.evaluate().isNotEmpty) {
    await tester.tap(transactionItem);
    await tester.pumpAndSettle();

    // Verify the transaction edit modal appears
    expect(find.text('Редактировать транзакцию'), findsOneWidget);

    // Test modifying transaction details
    await _fillTransactionForm(tester, isNewTransaction: false);

    // Save the changes
    final saveButton = find.text('Сохранить');
    expect(saveButton, findsOneWidget);
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }
}

Future<void> _testDeleteTransaction(WidgetTester tester) async {
  // Find a transaction in the list to delete
  final transactionItem = find.byType(ListTile).first;
  if (transactionItem.evaluate().isNotEmpty) {
    await tester.tap(transactionItem);
    await tester.pumpAndSettle();

    // Look for delete button in the edit modal
    final deleteButton = find.byIcon(Icons.delete);
    if (deleteButton.evaluate().isNotEmpty) {
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      // Confirm deletion if there's a confirmation dialog
      final confirmButton = find.text('Удалить');
      if (confirmButton.evaluate().isNotEmpty) {
        await tester.tap(confirmButton);
        await tester.pumpAndSettle();
      }

      // Verify we're back to the summary page
      expect(find.text('Сводка'), findsWidgets);
    }
  }
}

Future<void> _testCategorySelection(WidgetTester tester) async {
  // Navigate to add transaction
  final addButton = find.byType(FloatingActionButton);
  if (addButton.evaluate().isNotEmpty) {
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Look for category selection button
    final categoryField = find.text('Категория');
    if (categoryField.evaluate().isNotEmpty) {
      await tester.tap(categoryField);
      await tester.pumpAndSettle();

      // Verify category selection modal appears
      expect(find.text('Выберите категорию'), findsOneWidget);

      // Select a category (assuming there are categories)
      final categoryItems = find.byType(ListTile);
      if (categoryItems.evaluate().isNotEmpty) {
        await tester.tap(categoryItems.first);
        await tester.pumpAndSettle();

        // Verify we're back to the transaction form
        expect(find.text('Добавить транзакцию'), findsOneWidget);
      }

      // Close the modal
      final closeButton = find.byIcon(Icons.close);
      if (closeButton.evaluate().isNotEmpty) {
        await tester.tap(closeButton);
        await tester.pumpAndSettle();
      }
    }
  }
}

Future<void> _testAccountSelection(WidgetTester tester) async {
  // Navigate to add transaction
  final addButton = find.byType(FloatingActionButton);
  if (addButton.evaluate().isNotEmpty) {
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Look for account selection button
    final accountField = find.text('Счёт');
    if (accountField.evaluate().isNotEmpty) {
      await tester.tap(accountField);
      await tester.pumpAndSettle();

      // Verify account selection modal appears
      expect(find.text('Выберите счёт'), findsOneWidget);

      // Select an account (assuming there are accounts)
      final accountItems = find.byType(ListTile);
      if (accountItems.evaluate().isNotEmpty) {
        await tester.tap(accountItems.first);
        await tester.pumpAndSettle();

        // Verify we're back to the transaction form
        expect(find.text('Добавить транзакцию'), findsOneWidget);
      }

      // Close the modal
      final closeButton = find.byIcon(Icons.close);
      if (closeButton.evaluate().isNotEmpty) {
        await tester.tap(closeButton);
        await tester.pumpAndSettle();
      }
    }
  }
}

Future<void> _fillTransactionForm(WidgetTester tester,
    {required bool isNewTransaction}) async {
  // Fill in amount
  final amountField = find.byType(TextField).first;
  if (amountField.evaluate().isNotEmpty) {
    await tester.enterText(amountField, '100.50');
    await tester.pumpAndSettle();
  }

  // Fill in comment
  final commentFields = find.byType(TextField);
  if (commentFields.evaluate().length > 1) {
    await tester.enterText(commentFields.at(1), 'Test transaction comment');
    await tester.pumpAndSettle();
  }

  // Select category if field exists
  final categoryField = find.text('Категория');
  if (categoryField.evaluate().isNotEmpty) {
    await tester.tap(categoryField);
    await tester.pumpAndSettle();

    // Select first category if available
    final categoryItems = find.byType(ListTile);
    if (categoryItems.evaluate().isNotEmpty) {
      await tester.tap(categoryItems.first);
      await tester.pumpAndSettle();
    }
  }

  // Select account if field exists
  final accountField = find.text('Счёт');
  if (accountField.evaluate().isNotEmpty) {
    await tester.tap(accountField);
    await tester.pumpAndSettle();

    // Select first account if available
    final accountItems = find.byType(ListTile);
    if (accountItems.evaluate().isNotEmpty) {
      await tester.tap(accountItems.first);
      await tester.pumpAndSettle();
    }
  }

  // Set date if date picker exists
  final dateField = find.byIcon(Icons.calendar_today);
  if (dateField.evaluate().isNotEmpty) {
    await tester.tap(dateField);
    await tester.pumpAndSettle();

    // Confirm current date
    final okButton = find.text('OK');
    if (okButton.evaluate().isNotEmpty) {
      await tester.tap(okButton);
      await tester.pumpAndSettle();
    }
  }

  // Toggle income/expense if toggle exists
  final incomeToggle = find.text('Доход');
  final expenseToggle = find.text('Расход');
  if (incomeToggle.evaluate().isNotEmpty &&
      expenseToggle.evaluate().isNotEmpty) {
    // Test toggling to expense
    await tester.tap(expenseToggle);
    await tester.pumpAndSettle();
  }
}
