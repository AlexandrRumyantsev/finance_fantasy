part of '../components.dart';

class ModalEditTransaction extends StatelessWidget {
  const ModalEditTransaction({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).extension<AppColors>()?.background,
        ),
        child: BlocBuilder<TransactionEditCubit, TransactionEditState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonFinanceAppBarWidget(
                  title: title,
                  prefix: const CrossIcon(),
                  onPrefixPressed: Navigator.of(context).pop,
                  suffix: const CheckIcon(),
                  onSuffixPressed: () async {
                    final result =
                        await context.read<TransactionEditCubit>().save();
                    if (result) {
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Ошибка при сохранении'),
                        ),
                      );
                    }
                  },
                ),
                const CustomDivider(),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        EditTransactionField(
                          label: 'Счет',
                          value: state.account?.name ?? '',
                          showChevron: true,
                          onTap: () {
                            final cubit = context.read<TransactionEditCubit>();
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => BlocProvider(
                                create: (context) => getIt<BankAccountCubit>(),
                                child: SelectBankAccount(
                                  onAccountSelected: cubit.updateAccount,
                                ),
                              ),
                            );
                          },
                        ),
                        const CustomDivider(),
                        EditTransactionField(
                          label: 'Статья',
                          value: state.category?.name ?? '',
                          showChevron: true,
                        ),
                        const CustomDivider(),
                        EditTransactionField(
                          label: 'Сумма',
                          value: state.amount?.toString() ?? '',
                          showChevron: true,
                        ),
                        const CustomDivider(),
                        EditTransactionField(
                          label: 'Дата',
                          value: state.dateOnly?.toString() ?? '',
                          showChevron: false,
                        ),
                        const CustomDivider(),
                        EditTransactionField(
                          label: 'Время',
                          value: state.timeOfDay?.toString() ?? '',
                          showChevron: false,
                        ),
                        const CustomDivider(),
                        EditTransactionField(
                          label: 'Комментарий',
                          value: state.comment ?? '',
                          showChevron: false,
                        ),
                        const CustomDivider(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
