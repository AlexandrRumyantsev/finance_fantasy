part of '../components.dart';

class CommonFinanceList extends StatelessWidget {
  const CommonFinanceList({
    super.key,
    required this.transactions,
  });

  final List<TransactionExtended> transactions;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => SummaryListItemWrapper(
        transaction: transactions[index],
      ),
      itemCount: transactions.length,
    );
  }
}
