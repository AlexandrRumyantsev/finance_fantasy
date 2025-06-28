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
          const SummaryTabNavigator(isExpense: true),
          const SummaryTabNavigator(isExpense: false),
          BlocProvider(
            create: (context) =>
                BankAccountCubit(getIt<GetBankAccountsUseCase>()),
            child: const BankAccountPage(),
          ),
          BlocProvider(
            create: (context) => CategoriesCubit(getIt<GetCategoriesUseCase>()),
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
