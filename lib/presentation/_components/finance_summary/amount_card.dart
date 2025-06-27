part of '../components.dart';

class CommonSummaryHeaderCard extends StatelessWidget {
  const CommonSummaryHeaderCard({
    super.key,
    required this.left,
    required this.right,
  });

  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
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
            Text(
              left,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 16),
            Text(right),
          ],
        ),
      ),
    );
  }
}
