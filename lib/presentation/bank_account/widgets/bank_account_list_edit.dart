part of '../bank_account.dart';

class BankAccountListEdit extends StatelessWidget {
  const BankAccountListEdit({
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
              BankAccountEditItem(bankAccount: bankAccounts[index]),
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
