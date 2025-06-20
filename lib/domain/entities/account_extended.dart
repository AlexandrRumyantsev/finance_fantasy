import 'package:finance_fantasy/domain/entities/account_brief.dart';

class AccountExtended extends AccountBrief {
  AccountExtended({
    required super.name,
    required super.currency,
    required super.balance,
    required super.id,
    required this.userId,
    required this.createdDate,
    required this.updatedDate,
  });

  final int userId;
  final DateTime createdDate;
  final DateTime updatedDate;
}
