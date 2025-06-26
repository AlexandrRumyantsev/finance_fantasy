import 'package:injectable/injectable.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/entities/error.dart';
import '../../../domain/repositories/categories.dart';
import '../../../utils/either.dart';
import '../../data_source/rest/categories.dart';

@injectable
class CategoriesApiRepository implements CategoriesRepository {
  CategoriesApiRepository(this._client);

  final CategoriesClient _client;

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
