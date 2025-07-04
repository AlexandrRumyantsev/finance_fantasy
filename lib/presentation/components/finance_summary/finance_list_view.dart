part of '../components.dart';

class CommonFinanceList extends StatelessWidget {
  const CommonFinanceList({
    super.key,
    required this.transactions,
    required this.statusPage,
  });

  final List<TransactionExtended> transactions;
  final StatusPage statusPage;

  @override
  Widget build(BuildContext context) {
    return switch (statusPage) {
      StatusPage.loading => const SliverFillRemaining(
          child: Center(child: AppCircularProgressIndicator()),
        ),
      StatusPage.empty => const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('Нет данных')),
        ),
      StatusPage.error => const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('Ошибка загрузки')),
        ),
      StatusPage.data => SliverList.builder(
          itemBuilder: (context, index) => SummaryListItemWrapper(
            transaction: transactions[index],
          ),
          itemCount: transactions.length,
        ),
    };
  }
}
