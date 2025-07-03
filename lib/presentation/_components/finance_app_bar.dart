part of 'components.dart';

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
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: 64,
      collapsedHeight: 64,
      backgroundColor: appColors.primary,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: ColoredBox(
          color: appColors.primary,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: prefix != null
                        ? GestureDetector(
                            onTap: onPrefixPressed,
                            child: Center(
                              child: prefix,
                            ),
                          )
                        : null,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(color: appColors.text, fontSize: 24),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: suffix != null
                        ? GestureDetector(
                            onTap: onSuffixPressed,
                            child: Center(
                              child: suffix,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
