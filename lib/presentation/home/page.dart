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
            create: (context) => getIt<ExpenseSummaryCubit>(),
            child:
                const SummaryTabNavigator<ExpenseSummaryCubit>(isExpense: true),
          ),
          BlocProvider(
            create: (context) => getIt<IncomesSummaryCubit>(),
            child: const SummaryTabNavigator<IncomesSummaryCubit>(
              isExpense: false,
            ),
          ),
          BlocProvider(
            create: (context) => getIt<BankAccountCubit>(),
            child: const BankAccountPage(),
          ),
          BlocProvider(
            create: (context) => getIt<CategoriesCubit>(),
            child: const CategoriesPage(),
          ),
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
