part of '../bank_account.dart';

class BankAccountEditItem extends StatelessWidget {
  const BankAccountEditItem({
    super.key,
    required this.bankAccount,
  });

  final AccountBrief bankAccount;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return IntrinsicHeight(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: appColors.background,
        ),
        child: Row(
          children: [
            Expanded(
              child: CommonSummaryHeaderCard(
                left: bankAccount.name,
                right: '${bankAccount.balance} ${bankAccount.currency}',
                rightIcon: ChevronRight(color: appColors.chevronRight),
              ),
            ),
            ColoredBox(
              color: appColors.deleteButton,
              child: AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.delete,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      appColors.background,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
