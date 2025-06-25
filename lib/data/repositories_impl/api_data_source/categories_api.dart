import '../../../domain/entities/category.dart';
import '../../../domain/entities/error.dart';
import '../../../domain/repositories/categories.dart';
import '../../../utils/either.dart';

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
