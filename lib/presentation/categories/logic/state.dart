part of 'cubit.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    this.categories = const [],
    this.status = StatusPage.loading,
    this.searchQuery = '',
  });

  final List<Category> categories;
  final StatusPage status;
  final String searchQuery;

  CategoriesState copyWith({
    List<Category>? categories,
    StatusPage? status,
    String? searchQuery,
  }) =>
      CategoriesState(
        categories: categories ?? this.categories,
        status: status ?? this.status,
        searchQuery: searchQuery ?? this.searchQuery,
      );

  @override
  List<Object?> get props => [categories, status, searchQuery];
}
