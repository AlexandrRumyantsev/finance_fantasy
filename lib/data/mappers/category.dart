import '../../domain/entities/category.dart' show Category;
import '../models/shared/category.dart';

extension CategoryMapping on Category {
  CategoryDto toDto() => CategoryDto(
    id: id,
    name: name,
    emoji: emoji,
    isIncome: isIncome,
  );
}

extension CategoryDtoMapping on CategoryDto {
  Category toDomain() => Category(
    id: id,
    name: name,
    emoji: emoji,
    isIncome: isIncome,
  );
}