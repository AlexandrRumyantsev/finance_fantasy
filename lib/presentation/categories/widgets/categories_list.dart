import 'package:flutter/material.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/entities/status_page.dart';
import 'categories_list_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.categories,
    required this.status,
  });

  final List<Category> categories;
  final StatusPage status;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      StatusPage.loading => const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      StatusPage.error => const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text('Ошибка загрузки статей'),
          ),
        ),
      StatusPage.data => SliverList.builder(
          itemBuilder: (context, index) => CategoriesListItem(
            category: categories[index],
          ),
          itemCount: categories.length,
        ),
      StatusPage.empty => const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text('Нет статей'),
          ),
        ),
    };
  }
}
