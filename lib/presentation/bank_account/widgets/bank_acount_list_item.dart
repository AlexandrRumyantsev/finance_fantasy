part of '../bank_account.dart';

class BankAccountListItem extends StatelessWidget {
  const BankAccountListItem({
    super.key,
    required this.bankAccount,
  });

  final AccountBrief bankAccount;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Column(
      children: [
        CommonHeaderCard(
          leftIcon: const Icon(Icons.account_balance),
          left: bankAccount.name,
          right: '${bankAccount.balance} ${bankAccount.currency}',
          rightIcon: ChevronRight(color: appColors.chevronRight),
        ),
        const CustomDivider(),
        CommonHeaderCard(
          left: 'Валюта',
          right: bankAccount.currency,
          rightIcon: ChevronRight(color: appColors.chevronRight),
        ),
      ],
    );
  }
}
