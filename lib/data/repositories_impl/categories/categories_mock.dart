import '../../../domain/entities/category.dart';
import '../../../domain/entities/error.dart';
import '../../../domain/repositories/categories.dart';
import '../../../utils/either.dart';

class MockCategoriesRepository implements CategoriesRepository {
  final List<Category> _categories = [
    Category(id: 1, name: 'Зарплата', emoji: '💰', isIncome: true),
    Category(id: 2, name: 'Продукты', emoji: '🛒', isIncome: false),
    Category(id: 3, name: 'Подарки', emoji: '🎁', isIncome: true),
    Category(id: 4, name: 'Транспорт', emoji: '🚌', isIncome: false),
  ];

  @override
  Future<Either<BaseError, List<Category>>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return Right(_categories);
  }

  @override
  Future<Either<BaseError, List<Category>>> getCategoriesByType({
    required bool isIncome,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final filtered =
        _categories.where((cat) => cat.isIncome == isIncome).toList();
    return Right(filtered);
  }
}
