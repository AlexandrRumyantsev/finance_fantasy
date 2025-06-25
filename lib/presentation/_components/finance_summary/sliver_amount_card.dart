part of '../components.dart';

class CommonSummaryHeaderCardDelegate extends SliverPersistentHeaderDelegate {
  const CommonSummaryHeaderCardDelegate({
    required this.left,
    required this.right,
    this.onTap,
  });

  final String left;
  final String right;
  final VoidCallback? onTap;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: CommonSummaryHeaderCard(left: left, right: right),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant CommonSummaryHeaderCardDelegate oldDelegate) {
    return left != oldDelegate.left || right != oldDelegate.right;
  }
}
