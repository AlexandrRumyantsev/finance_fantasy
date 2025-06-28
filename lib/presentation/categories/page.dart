part of 'categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CommonFinanceAppBar(
            title: 'Мои статьи',
          ),
          const SliverPersistentHeader(
            pinned: true,
            delegate: _SearchBarDelegate(
              child: CategoriesSearchBar(),
            ),
          ),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) => CategoriesList(
              categories: context.read<CategoriesCubit>().filteredCategories,
              status: state.status,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  const _SearchBarDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 56;

  @override
  double get maxExtent => 56;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(
      height: 56,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
