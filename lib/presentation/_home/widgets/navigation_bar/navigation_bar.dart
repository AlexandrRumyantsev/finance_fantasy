part of '../../home.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required int currentPage,
    required ValueChanged<int> onNavBarTap,
  })  : _currentPage = currentPage,
        _onNavBarTap = onNavBarTap;

  final int _currentPage;
  final ValueChanged<int> _onNavBarTap;

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      _iconPaths.length,
      (i) {
        return Expanded(
          child: GestureDetector(
            onTap: () => _onNavBarTap(i),
            child: NavigationBarItem(
              assetPath: _iconPaths[i],
              label: _labels[i],
              isSelected: i == _currentPage,
            ),
          ),
        );
      },
    );
    final children = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      children.add(items[i]);
      if (i < items.length - 1) {
        children.add(const SizedBox(width: 8));
      }
    }
    return SafeArea(
      child: ColoredBox(
        color: const Color(0xFFF3EDF7),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 16),
          child: Row(
            children: children,
          ),
        ),
      ),
    );
  }

  static const List<String> _iconPaths = [
    AppIcons.expense,
    AppIcons.incomes,
    AppIcons.bankAccount,
    AppIcons.categories,
    AppIcons.settings,
  ];

  static const List<String> _labels = [
    'Расходы',
    'Доходы',
    'Счет',
    'Статьи',
    'Настройки',
  ];
}
