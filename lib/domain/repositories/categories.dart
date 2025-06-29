import 'package:injectable/injectable.dart';

import '../../data/data_source/rest/categories.dart';
import '../../data/repositories_impl/categories.dart';
import '../../utils/either.dart';

import '../entities/category.dart';
import '../entities/error.dart';

@injectable
abstract interface class CategoriesRepository {
  @factoryMethod
  factory CategoriesRepository(CategoriesClient client) =>
      CategoriesRepositoryImpl(client);

  Future<Either<BaseError, List<Category>>> getCategories();

  Future<Either<BaseError, List<Category>>> getCategoriesByType({
    required bool isIncome,
  });
}
