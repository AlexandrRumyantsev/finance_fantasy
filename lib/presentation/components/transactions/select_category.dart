part of '../components.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({
    super.key,
    this.onCategorySelected,
    this.isIncome = false,
  });

  final void Function(Category category)? onCategorySelected;
  final bool isIncome;

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().loadCategoriesByType(widget.isIncome);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: appColors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: appColors.divider,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Выберите категорию',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: appColors.text,
                      ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: appColors.text,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state.categories.isEmpty) {
                  return const SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Нет доступных категорий',
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return _CategorySelectionItem(
                      category: category,
                      onTap: () {
                        widget.onCategorySelected?.call(category);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  separatorBuilder: (context, index) => CustomDivider(
                    color: appColors.divider,
                  ),
                  itemCount: state.categories.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySelectionItem extends StatelessWidget {
  const _CategorySelectionItem({
    required this.category,
    required this.onTap,
  });

  final Category category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: appColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  category.emoji,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: appColors.chevronRight,
            ),
          ],
        ),
      ),
    );
  }
}
