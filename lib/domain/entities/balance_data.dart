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

class MockBalanceData {
  static List<BalanceData> getMonthlyData() {
    final now = DateTime.now();
    final List<BalanceData> data = [];

    for (int i = 30; i >= 0; i--) {
      final date = DateTime(now.year, now.month, now.day - i);
      final balance = 50000 + (i * 1000) + (i % 3 == 0 ? -2000 : 0);
      final isPositive = balance >= 50000;

      data.add(BalanceData(
        date: date,
        balance: balance.toDouble(),
        isPositive: isPositive,
      ));
    }

    return data;
  }
}
