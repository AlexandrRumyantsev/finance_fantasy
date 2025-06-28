part of '../bank_account.dart';


class BankAccountList extends StatelessWidget {
  const BankAccountList({
    super.key,
    required this.bankAccounts,
    required this.status,
  });

  final List<AccountBrief> bankAccounts;
  final StatusPage status;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      StatusPage.loading => const SliverFillRemaining(
          hasScrollBody: false,
          child: AppCircularProgressIndicator(),
        ),
      StatusPage.data => SliverList.builder(
          itemCount: bankAccounts.length,
          itemBuilder: (context, index) =>
              BankAccountListItem(bankAccount: bankAccounts[index]),
        ),
      StatusPage.error => const SliverFillRemaining(
          hasScrollBody: false,
          child: Text('Ошибка загрузки счетов'),
        ),
      StatusPage.empty => const SliverFillRemaining(
          hasScrollBody: false,
          child: Text('Счета не найдены'),
        ),
    };
  }
}
