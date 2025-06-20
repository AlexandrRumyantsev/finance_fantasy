import 'package:finance_fantasy/domain/entities/category.dart';

import 'package:finance_fantasy/domain/entities/error.dart';

import 'package:finance_fantasy/utils/either.dart';

import '../../../domain/repositories/categories.dart';

class CategoriesApiRepository implements CategoriesRepository {
  @override
  Future<Either<BaseError, List<Category>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<Category>>> getCategoriesByType({
    required bool isIncome,
  }) {
    // TODO: implement getCategoriesByType
    throw UnimplementedError();
  }
}
