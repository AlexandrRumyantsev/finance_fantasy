import 'package:injectable/injectable.dart';

import '../../utils/either.dart';
import '../entities/category.dart';
import '../entities/error.dart';
import '../repositories/categories.dart';
import 'use_case.dart';

@injectable
class GetCategoriesUseCase implements UseCase<BaseError, List<Category>, void> {
  GetCategoriesUseCase(this._repository);

  final CategoriesRepository _repository;

  @override
  Future<Either<BaseError, List<Category>>> call(_) async {
    return _repository.getCategories();
  }
}
