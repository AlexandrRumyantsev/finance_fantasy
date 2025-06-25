import '../../domain/entities/account_brief.dart';
import '../../domain/entities/account_extended.dart';
import '../models/shared/account.dart';
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

extension AccountDtoMapping on AccountDto {
  AccountBrief toDomainBrief() => AccountBrief(
        id: id,
        name: name,
        currency: currency,
        balance: double.parse(balance),
      );

  AccountExtended toDomainExtended() => AccountExtended(
        name: name,
        currency: currency,
        balance: double.parse(balance),
        id: id,
        userId: userId,
        createdDate: createdAt,
        updatedDate: updatedAt,
      );
}
