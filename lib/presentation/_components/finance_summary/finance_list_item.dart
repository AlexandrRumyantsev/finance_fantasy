part of '../components.dart';

class SummaryListItem extends StatelessWidget {
  const SummaryListItem({
    super.key,
    required this.emoji,
    required this.categoryName,
    required this.amount,
    required this.currency,
    this.comment,
  });

  final String emoji;
  final String categoryName;
  final String? comment;
  final String amount;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(emoji),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(categoryName),
              if (comment != null) Text(comment!),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: amount,
            children: [
              TextSpan(text: ' $currency'),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const ChevronRight(
          size: 24,
          color: Color(0x333C3C434D),
        ),
      ],
    );
  }
}
