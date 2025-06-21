part of '../components.dart';

class CommonAmountCardDelegate extends SliverPersistentHeaderDelegate {
  final double amount;
  final String currency;

  CommonAmountCardDelegate({
    required this.amount,
    this.currency = 'RUB',
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return CommonAmountCard(amount: amount, currency: currency);
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant CommonAmountCardDelegate oldDelegate) {
    return amount != oldDelegate.amount || currency != oldDelegate.currency;
  }
}
