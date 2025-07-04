part of '../components.dart';

class EditTransactionField extends StatelessWidget {
  const EditTransactionField({
    super.key,
    required this.label,
    required this.value,
    required this.showChevron,
    this.onTap,
  });

  final String label;
  final String value;
  final bool showChevron;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
        child: Row(
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            const Spacer(),
            Text(value, style: Theme.of(context).textTheme.bodyMedium),
            if (showChevron)
            const ChevronRight(),
          ],
        ),
      ),
    );
  }
}
