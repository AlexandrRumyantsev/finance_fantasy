import '../../domain/entities/account_brief.dart';
import '../models/shared/account_brief.dart';

extension AccountBriefMapping on AccountBrief {
  AccountBriefDto toDto() => AccountBriefDto(
        id: id,
        name: name,
        currency: currency,
        balance: balance.toString(),
      );
}

extension AccountBriefDtoMapping on AccountBriefDto {
  AccountBrief toDomain() => AccountBrief(
        id: id,
        name: name,
        currency: currency,
        balance: double.parse(balance),
      );
}
