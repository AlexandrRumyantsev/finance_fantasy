part of '../components.dart';

class CommonFinanceAppBar extends StatelessWidget {
  const CommonFinanceAppBar({
    super.key,
    required this.title,
    this.suffix,
    this.prefix,
    this.onSuffixPressed,
    this.onPrefixPressed,
  });

  final String title;
  final Widget? suffix;
  final Widget? prefix;
  final VoidCallback? onSuffixPressed;
  final VoidCallback? onPrefixPressed;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final suffix = this.suffix;
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: 64,
      collapsedHeight: 64,
      centerTitle: true,
      backgroundColor: appColors.primary,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyle(color: appColors.text),
      ),
      leading: GestureDetector(
        onTap: onPrefixPressed,
        child: prefix,
      ),
      actions: [
        if (suffix != null)
          GestureDetector(
            onTap: onSuffixPressed,
            child: suffix,
          ),
      ],
    );
  }
}
