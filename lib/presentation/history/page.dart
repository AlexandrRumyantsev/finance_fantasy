// ignore_for_file: lines_longer_than_80_chars

part of 'history.dart';

class HistoryPage<C extends BaseSummaryCubit> extends StatefulWidget {
  const HistoryPage({
    super.key,
    required this.isIncome,
  });

  final bool isIncome;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState<C extends BaseSummaryCubit>
    extends State<HistoryPage<C>> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<C>();
    cubit.initState(
      dateRange: DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 30)),
        end: DateTime.now(),
      ),
    );
    cubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return Scaffold(
      body: BlocBuilder<C, SummaryState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: cubit.loadData,
            color: Theme.of(context).extension<AppColors>()?.primary,
            child: CustomScrollView(
              slivers: [
                CommonFinanceAppBar(
                  title:
                      AppLocalizations.of(context)?.myHistory ?? 'Моя история',
                  suffix: SvgPicture.asset(AppIcons.history),
                  prefix: const Icon(Icons.arrow_back),
                  onPrefixPressed: () => Navigator.of(context).pop(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CommonSummaryHeaderCardDelegate(
                    left: AppLocalizations.of(context)?.start ?? 'Начало',
                    right: state.dateRange?.start
                            .toLocal()
                            .toString()
                            .split(' ')[0] ??
                        '',
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        initialDate: state.dateRange?.start ?? DateTime.now(),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                      );
                      if (date != null) {
                        cubit.setDateRange(from: date);
                      }
                    },
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CommonSummaryHeaderCardDelegate(
                    left: AppLocalizations.of(context)?.end ?? 'Конец',
                    right: state.dateRange?.end
                            .toLocal()
                            .toString()
                            .split(' ')[0] ??
                        '',
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        initialDate: state.dateRange?.end ?? DateTime.now(),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                      );
                      if (date != null) {
                        cubit.setDateRange(to: date);
                      }
                    },
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CommonSummaryHeaderCardDelegate(
                    left: AppLocalizations.of(context)?.amount ?? 'Сумма',
                    right:
                        '${state.totalAmount.toStringAsFixed(2)} ${AppLocalizations.of(context)?.currency ?? 'RUB'}',
                  ),
                ),
                CommonFinanceList<C>(
                  transactions: state.transactions ?? [],
                  statusPage: state.statusPage,
                  isIncome: widget.isIncome,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
