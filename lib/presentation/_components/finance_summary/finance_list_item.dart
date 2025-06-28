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
    final appColors = Theme.of(context).extension<AppColors>()!;
    final comment = this.comment;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(emoji, style: const TextStyle(fontSize: 24)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(categoryName),
                          if (comment != null)
                            Text(
                              comment,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$amount $currency'),
                  const SizedBox(width: 8),
                  ChevronRight(
                    color: appColors.chevronRight,
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomDivider(color: appColors.divider),
      ],
    );
  }
}
