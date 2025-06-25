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
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Color(0xFFD4FAE6),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFCAC4D0),
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
