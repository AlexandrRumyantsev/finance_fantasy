part of '../components.dart';

class CommonFinanceAppBar extends StatelessWidget {
  const CommonFinanceAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: 64,
      collapsedHeight: 64,
      centerTitle: true,
      backgroundColor: const Color(0xFF2AE881),
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_time_outlined, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }
}
