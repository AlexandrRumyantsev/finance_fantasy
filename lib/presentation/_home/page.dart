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
        children: const [
          SummaryTabNavigator(isExpense: true),
          SummaryTabNavigator(isExpense: false),
          BankAccountPage(),
          CategoriesPage(),
          SettingsPage(),
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
