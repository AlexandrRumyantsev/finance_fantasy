import '../../../domain/entities/category.dart';
import '../../../domain/entities/error.dart';
import '../../../domain/repositories/categories.dart';
import '../../../utils/either.dart';
import '../data_source/rest/categories.dart';
import '../mappers/category.dart';


class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl(this._client);

  final CategoriesClient _client;

  @override
  Future<Either<BaseError, List<Category>>> getCategories() async {
    try {
      final response = await _client.getCategories();
      return Right(response.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<Category>>> getCategoriesByType({
    required bool isIncome,
  }) async {
    try {
      final response = await _client.getCategoriesByType(isIncome);
      return Right(response.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }
}
