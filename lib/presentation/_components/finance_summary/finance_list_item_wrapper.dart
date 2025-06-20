part of '../components.dart';

class SummaryListItemWrapper extends StatelessWidget {
  const SummaryListItemWrapper({super.key, required this.transaction});

  final TransactionExtended transaction;

  @override
  Widget build(BuildContext context) {
    return SummaryListItem(
      emoji: transaction.category.emoji,
      categoryName: transaction.category.name,
      amount: transaction.amount.toString(),
      comment: transaction.comment,
      currency: transaction.account.currency,
    );
  }
}
