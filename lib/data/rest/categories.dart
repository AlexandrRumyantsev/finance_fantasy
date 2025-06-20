import 'package:dio/dio.dart';
import 'package:finance_fantasy/data/models/shared/category.dart';
import 'package:retrofit/retrofit.dart';

part 'categories.g.dart';

@RestApi()
abstract class CategoriesClient {
  factory CategoriesClient(Dio dio) => _CategoriesClient(dio);

  @GET('/categories')
  Future<List<CategoryDto>> getCategories();

  @GET('/categories/type/{isIncome}')
  Future<List<CategoryDto>> getCategoriesByType(@Path() bool isIncome);
}
