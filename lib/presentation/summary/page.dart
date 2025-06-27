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
              switch (state.statusPage) {
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
                StatusPage.data => CommonFinanceList(
                    transactions: state.transactions ?? [],
                  ),
              },
            ],
          );
        },
      ),
    );
  }
}
