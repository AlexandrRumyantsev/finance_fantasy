part of '../components.dart';

class ModalEditTransaction extends StatefulWidget {
  const ModalEditTransaction({
    super.key,
    required this.title,
    required this.isIncome,
  });

  final String title;
  final bool isIncome;

  @override
  State<ModalEditTransaction> createState() => _ModalEditTransactionState();
}

class _ModalEditTransactionState extends State<ModalEditTransaction> {
  late TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TransactionEditCubit>();
    return Material(
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
                  title: widget.title,
                  prefix: const CrossIcon(),
                  onPrefixPressed: Navigator.of(context).pop,
                  suffix: const CheckIcon(),
                  onSuffixPressed: () async {
                    final context = this.context;
                    final result = await cubit.save();
                    if (!context.mounted) return;
                    if (result) {
                      Navigator.of(context).pop(true);
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
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => BlocProvider(
                                create: (context) => getIt<CategoriesCubit>(),
                                child: SelectCategory(
                                  isIncome: widget.isIncome,
                                  onCategorySelected: cubit.updateCategory,
                                ),
                              ),
                            );
                          },
                        ),
                        const CustomDivider(),
                        EditTransactionField(
                          label: 'Сумма',
                          value:
                              '${state.amount?.toStringAsFixed(2) ?? '0.00'} ${state.account?.currency ?? 'RUB'}',
                          showChevron: false,
                          onTap: () {
                            showModalBottomSheet<double>(
                              context: context,
                              builder: (context) => AmountInputModal(
                                initialValue: state.amount?.toString() ?? '',
                              ),
                            ).then((value) {
                              if (value != null) {
                                cubit.updateAmount(value);
                              }
                            });
                          },
                        ),
                        const CustomDivider(),
                        EditTransactionField(
                          label: 'Дата',
                          value: state.dateOnly?.toDateString() ?? '',
                          showChevron: false,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: state.transactionDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                            ).then((value) {
                              if (value != null) {
                                cubit.updateDate(value);
                              }
                            });
                          },
                        ),
                        const CustomDivider(),
                        EditTransactionField(
                          label: 'Время',
                          value: state.timeOfDay?.toTimeString() ?? '',
                          showChevron: false,
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: state.timeOfDay ?? TimeOfDay.now(),
                              builder: (context, child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context).copyWith(
                                    alwaysUse24HourFormat: true,
                                  ),
                                  child: child!,
                                );
                              },
                            ).then((value) {
                              if (value != null) {
                                cubit.updateTime(value);
                              }
                            });
                          },
                        ),
                        const CustomDivider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: BlocBuilder<TransactionEditCubit,
                              TransactionEditState>(
                            builder: (context, state) {
                              if (_commentController.text !=
                                  (state.comment ?? '')) {
                                _commentController.text = state.comment ?? '';
                              }
                              return TextField(
                                controller: _commentController,
                                onChanged: cubit.updateComment,
                                decoration: const InputDecoration(
                                  hintText: 'Комментарий',
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 16),
                                ),
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: null,
                                textInputAction: TextInputAction.done,
                              );
                            },
                          ),
                        ),
                        const CustomDivider(),
                        Visibility(
                          visible: !cubit.state.isNewTransaction,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .extension<AppColors>()
                                      ?.deleteButton,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                                onPressed: () async {
                                  final context = this.context;
                                  final result = await cubit.delete();
                                  if (!context.mounted) return;
                                  if (result) {
                                    Navigator.of(context).pop(true);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Ошибка при удалении'),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  'Удалить ${widget.isIncome ? 'доход' : 'расход'}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
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
