part of 'summary.dart';

class SummaryPage<C extends BaseSummaryCubit> extends StatelessWidget {
  const SummaryPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<C, SummaryState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CommonFinanceAppBar<C>(title: title),
              SliverPersistentHeader(
                pinned: true,
                delegate: CommonAmountCardDelegate(amount: state.totalAmount),
              ),
              _buildContentByStatus(state),
            ],
          );
        },
      ),
    );
  }
}

Widget _buildContentByStatus(SummaryState state) {
  switch (state.statusPage) {
    case StatusPage.loading:
      return const SliverFillRemaining(
        child: Center(child: AppCircularProgressIndicator()),
      );
    case StatusPage.empty:
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            'Нет данных',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    case StatusPage.error:
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            'Ошибка загрузки',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    case StatusPage.data:
      return CommonFinanceList(transactions: state.transactions ?? []);
  }
}
