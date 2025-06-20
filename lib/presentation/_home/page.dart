part of 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => ExpenseSummaryCubit(),
      child: const SummaryPage<ExpenseSummaryCubit>(title: 'Расходы сегодня'),
    ),
    BlocProvider(
      create: (context) => IncomesSummaryCubit(),
      child: const SummaryPage<IncomesSummaryCubit>(title: 'Доходы сегодня'),
    ),
    const BankAccountPage(),
    const CategoriesPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onNavBarTap,
        children: _pages.map((page) => KeepAliveWrapper(child: page)).toList(),
      ),
      bottomNavigationBar: AppNavigationBar(
        currentPage: _currentPage,
        onNavBarTap: _onNavBarTap,
        iconPaths: const [
          AppIcons.expense,
          AppIcons.incomes,
          AppIcons.bankAccount,
          AppIcons.categories,
          AppIcons.settings,
        ],
        labels: const [
          'Расходы',
          'Доходы',
          'Счет',
          'Статьи',
          'Настройки',
        ],
      ),
    );
  }

  void _onNavBarTap(int index) {
    if (index == _currentPage) return;

    if ((index - _currentPage).abs() == 1) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.jumpToPage(index);
    }

    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
