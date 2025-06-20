import 'package:finance_fantasy/domain/entities/account_fields.dart';

class AccountBrief extends AccountFields {
  AccountBrief({
    required super.name,
    required super.currency,
    required super.balance,
    required this.id,
  });

  final int id;
}
