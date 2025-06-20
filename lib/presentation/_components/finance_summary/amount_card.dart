part of '../components.dart';

class CommonAmountCard extends StatelessWidget {
  const CommonAmountCard({
    super.key,
    required this.amount,
    required this.currency,
  });

  final double amount;
  final String currency;

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
            const Text(
              'Всего',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 16),
            Text('${amount.formatAmount()} $currency'),
          ],
        ),
      ),
    );
  }
}
