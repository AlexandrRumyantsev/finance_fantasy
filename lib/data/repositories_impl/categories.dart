import '../../../domain/entities/category.dart';
import '../../../domain/entities/error.dart';
import '../../../domain/repositories/categories.dart';
import '../../../utils/either.dart';
import '../data_source/rest/api_service.dart';
import '../mappers/category.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<Either<BaseError, List<Category>>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
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
      final response = await _apiService.getCategoriesByType(isIncome);
      return Right(response.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }
}
