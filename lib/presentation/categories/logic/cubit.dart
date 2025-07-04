import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/entities/status_page.dart';
import '../../../domain/usecases/categories/get_categories.dart';

part 'state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._getCategoriesUseCase) : super(const CategoriesState());

  final GetCategoriesUseCase _getCategoriesUseCase;

  Future<void> loadData() async {
    await getCategories();
  }

  Future<void> getCategories() async {
    emit(state.copyWith(status: StatusPage.loading));
    final result = await _getCategoriesUseCase.call(null);
    result.fold(
      (error) => emit(state.copyWith(status: StatusPage.error)),
      (categories) => emit(
        state.copyWith(
          categories: categories,
          status: StatusPage.data,
        ),
      ),
    );
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void clearSearch() {
    emit(state.copyWith(searchQuery: ''));
  }

  List<Category> get filteredCategories {
    if (state.searchQuery.isEmpty) {
      return state.categories;
    }

    final fuzzy = Fuzzy(
      state.categories,
      options: FuzzyOptions(
        threshold: 0.4,
        keys: [
          WeightedKey(
            name: 'name',
            weight: 1.0,
            getter: (Category category) => category.name,
          ),
        ],
      ),
    );

    final results = fuzzy.search(state.searchQuery);
    return results.map((result) => result.item).toList();
  }
}
