import 'package:injectable/injectable.dart';

import '../../data/data_source/rest/api_client.dart';
import '../../data/repositories_impl/categories.dart';
import '../../utils/either.dart';

import '../entities/category.dart';
import '../entities/error.dart';

@singleton
abstract interface class CategoriesRepository {
  @factoryMethod
  factory CategoriesRepository(ApiClient client) =>
      CategoriesRepositoryImpl(client);

  Future<Either<BaseError, List<Category>>> getCategories();

  Future<Either<BaseError, List<Category>>> getCategoriesByType({
    required bool isIncome,
  });
}
