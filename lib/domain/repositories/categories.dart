import '../../utils/either.dart';

import '../entities/category.dart';
import '../entities/error.dart';

abstract interface class CategoriesRepository {
  Future<Either<BaseError, List<Category>>> getCategories();

  Future<Either<BaseError, List<Category>>> getCategoriesByType({
    required bool isIncome,
  });
}
