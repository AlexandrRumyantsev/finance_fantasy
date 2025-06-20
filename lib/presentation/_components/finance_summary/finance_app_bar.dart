part of '../components.dart';

class CommonFinanceAppBar<C extends BaseSummaryCubit> extends StatelessWidget {
  const CommonFinanceAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: 64,
      collapsedHeight: 64,
      centerTitle: true,
      backgroundColor: const Color(0xFF2AE881),
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            AppIcons.selectPeriod,
            width: 40,
            height: 40,
          ),
          onPressed: () async {
            final DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: cubit.state.dateRange?.end,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              builder: (context, child) {
                return AppDatePickerTheme(
                  child: child!,
                );
              },
            );
            if (selectedDate == null) return;
            cubit.updateSelectedPeriod(
                DateTimeRange(start: selectedDate, end: selectedDate));
          },
        ),
      ],
    );
  }
}
