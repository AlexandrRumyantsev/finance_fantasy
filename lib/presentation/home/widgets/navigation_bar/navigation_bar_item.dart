part of '../../home.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.assetPath,
    required this.label,
    required this.isSelected,
  });

  final String assetPath;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final fontWeight = isSelected ? FontWeight.w600 : FontWeight.w500;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.4),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isSelected ? appColors.secondary : Colors.transparent,
              ),
              duration: isSelected
                  ? const Duration(milliseconds: 300)
                  : Duration.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 20,
                ),
                child: SvgPicture.asset(
                  assetPath,
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? appColors.primary
                        : appColors.unselectedButtonNavBar,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
