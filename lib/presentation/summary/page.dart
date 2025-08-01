part of 'summary.dart';

class SummaryPage<C extends BaseSummaryCubit> extends StatefulWidget {
  const SummaryPage({
    super.key,
    required this.title,
    this.onSuffixPressed,
  });

  final String title;
  final VoidCallback? onSuffixPressed;

  @override
  State<SummaryPage<C>> createState() => _SummaryPageState<C>();
}

class _SummaryPageState<C extends BaseSummaryCubit>
    extends State<SummaryPage<C>> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<C>();
    cubit.initState();
    cubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    final isIncome = cubit is IncomesSummaryCubit;
    return Scaffold(
      body: BlocBuilder<C, SummaryState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: cubit.loadData,
            color: Theme.of(context).extension<AppColors>()?.primary,
            child: CustomScrollView(
              slivers: [
                CommonFinanceAppBar(
                  title: widget.title,
                  suffix: SvgPicture.asset(AppIcons.selectPeriod),
                  onSuffixPressed: widget.onSuffixPressed,
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CommonSummaryHeaderCardDelegate(
                    left: AppLocalizations.of(context)?.total ?? 'Всего',
                    right: '${state.totalAmount.toStringAsFixed(2)} RUB',
                  ),
                ),
                CommonFinanceList<C>(
                  transactions: state.transactions ?? [],
                  statusPage: state.statusPage,
                  isIncome: isIncome,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'summary_fab_${isIncome ? 'income' : 'expense'}',
        onPressed: () {
          final isIncome = context.read<C>() is IncomesSummaryCubit;
          final title = isIncome ? 'Добавить доход' : 'Добавить расход';
          showGeneralDialog<bool>(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
              create: (context) => getIt<TransactionEditCubit>(
                param1: TransactionEditState(
                  transactionDate: DateTime.now(),
                ),
              ),
              child: ModalEditTransaction(
                title: title,
                isIncome: isIncome,
              ),
            ),
          ).then((value) {
            if (value != true) return;
            cubit.loadData();
          });
        },
        backgroundColor: Theme.of(context).extension<AppColors>()?.primary,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
