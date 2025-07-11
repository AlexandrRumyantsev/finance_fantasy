import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/shared/category.dart';

part 'categories.g.dart';

/// [CategoriesClient] is a client for the categories API.
@injectable
@RestApi()
abstract class CategoriesClient {
  @factoryMethod
  factory CategoriesClient(Dio dio) => _CategoriesClient(dio);

  @GET('/categories')
  Future<List<CategoryDto>> getCategories();

  @GET('/categories/type/{isIncome}')
  Future<List<CategoryDto>> getCategoriesByType(@Path() bool isIncome);
}
