part of '../components.dart';

class SummaryListItemWrapper<C extends BaseSummaryCubit>
    extends StatelessWidget {
  const SummaryListItemWrapper({
    super.key,
    required this.transaction,
    required this.isIncome,
  });

  final TransactionExtended transaction;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return GestureDetector(
      onTap: () {
        final title = isIncome ? 'Редактировать доход' : 'Редактировать расход';
        showGeneralDialog<bool>(
          context: context,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => getIt<TransactionEditCubit>(
              param1: TransactionEditState(
                transactionId: transaction.id,
                amount: transaction.amount,
                category: transaction.category,
                account: transaction.account,
                transactionDate: transaction.transactionDate,
                comment: transaction.comment,
              ),
            ),
            child: ModalEditTransaction(
              title: title,
              isIncome: isIncome,
            ),
          ),
          transitionDuration: const Duration(milliseconds: 300),
          transitionBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ).then((value) {
          if (value ?? false) {
            cubit.loadData();
          }
        });
      },
      child: ColoredBox(
        color: Colors.transparent,
        child: SummaryListItem(
          emoji: transaction.category.emoji,
          categoryName: transaction.category.name,
          amount: transaction.amount.toStringAsFixed(2),
          comment: transaction.comment,
          currency: transaction.account.currency,
        ),
      ),
    );
  }
}
