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
    final appColors = Theme.of(context).extension<AppColors>()!;
    final items = List.generate(
      iconPaths.length,
      (i) {
        return Expanded(
          child: GestureDetector(
            onTap: () => _onNavBarTap(i),
            child: NavigationBarItem(
              assetPath: iconPaths[i],
              label: labels[i],
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
        color: appColors.surfaceContainer,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 16),
          child: Row(
            children: children,
          ),
        ),
      ),
    );
  }

  static const iconPaths = [
    AppIcons.expense,
    AppIcons.incomes,
    AppIcons.bankAccount,
    AppIcons.categories,
    AppIcons.settings,
  ];
  static const labels = [
    'Расходы',
    'Доходы',
    'Счет',
    'Статьи',
    'Настройки',
  ];
}
