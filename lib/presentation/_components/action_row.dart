part of 'components.dart';

class CommonHeaderCard extends StatelessWidget {
  const CommonHeaderCard({
    super.key,
    required this.left,
    required this.right,
    this.leftIcon,
    this.rightIcon,
  });

  final Widget? leftIcon;
  final Widget? rightIcon;
  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    final leftIcon = this.leftIcon;
    final rightIcon = this.rightIcon;
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: appColors.secondary,
        border: Border(
          bottom: BorderSide(
            color: appColors.divider,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (leftIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: leftIcon,
                  ),
                Text(
                  left,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                Text(right),
                if (rightIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: rightIcon,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
