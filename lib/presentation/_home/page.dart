part of 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPage,
        children: [
          BlocProvider(
            create: (context) => ExpenseSummaryCubit(),
            child: const SummaryPage<ExpenseSummaryCubit>(
              title: 'Расходы сегодня',
            ),
          ),
          BlocProvider(
            create: (context) => IncomesSummaryCubit(),
            child:
                const SummaryPage<IncomesSummaryCubit>(title: 'Доходы сегодня'),
          ),
          const BankAccountPage(),
          const CategoriesPage(),
          const SettingsPage(),
        ],
      ),
      bottomNavigationBar: AppNavigationBar(
        currentPage: _currentPage,
        onNavBarTap: _onNavBarTap,
      ),
    );
  }

  void _onNavBarTap(int index) {
    if (index == _currentPage) return;
    setState(() {
      _currentPage = index;
    });
  }
}
