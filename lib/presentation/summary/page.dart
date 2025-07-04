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
    return Scaffold(
      body: BlocBuilder<C, SummaryState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CommonFinanceAppBar(
                title: widget.title,
                suffix: SvgPicture.asset(AppIcons.selectPeriod),
                onSuffixPressed: widget.onSuffixPressed,
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: CommonSummaryHeaderCardDelegate(
                  left: 'Всего',
                  right: '${state.totalAmount} RUB',
                ),
              ),
              CommonFinanceList(
                transactions: state.transactions ?? [],
                statusPage: state.statusPage,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isIncome = context.read<C>() is IncomesSummaryCubit;
          final title = isIncome ? 'Добавить доход' : 'Добавить расход';
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: BlocProvider(
                create: (context) => getIt<TransactionEditCubit>(),
                child: ModalEditTransaction(title: title),
              ),
            ),
          );
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
