import 'package:flutter/material.dart';

import '../../../domain/entities/category.dart';
import '../../../utils/colors.dart';
import '../../components/components.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
          child: Row(
            children: [
              Text(category.emoji),
              const SizedBox(width: 16),
              Text(category.name),
            ],
          ),
        ),
        CustomDivider(color: appColors.divider),
      ],
    );
  }
}
