import 'package:equatable/equatable.dart';

class BalanceData extends Equatable {
  const BalanceData({
    required this.date,
    required this.balance,
    required this.isPositive,
  });

  final DateTime date;
  final double balance;
  final bool isPositive;

  @override
  List<Object?> get props => [date, balance, isPositive];
}
