import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/balance_data.dart';
import '../../utils/colors.dart';

class BalanceChart extends StatelessWidget {
  const BalanceChart({
    super.key,
    required this.data,
    this.height = 200,
  });

  final List<BalanceData> data;
  final double height;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    if (data.isEmpty) {
      return SizedBox(
        height: height,
        child: const Center(
          child: Text('Нет данных для отображения'),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: _getMaxBalance(),
            minY: _getMinBalance(),
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  final balanceData = data[group.x];
                  return BarTooltipItem(
                    '${balanceData.date.day}.${balanceData.date.month}\n'
                    '${NumberFormat('#,###').format(balanceData.balance)} ₽',
                    TextStyle(
                      color: appColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              rightTitles: const AxisTitles(
                
              ),
              topTitles: const AxisTitles(
                
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    // Показываем только 3 даты: начало, середина, конец
                    final dataLength = data.length;
                    if (value.toInt() == 0) {
                      // Начало
                      final balanceData = data[0];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${balanceData.date.day}.${balanceData.date.month}',
                          style: TextStyle(
                            color: appColors.text.withValues(alpha: 0.7),
                            fontSize: 12,
                          ),
                        ),
                      );
                    } else if (value.toInt() == (dataLength - 1) / 2) {
                      // Середина
                      final balanceData = data[value.toInt()];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${balanceData.date.day}.${balanceData.date.month}',
                          style: TextStyle(
                            color: appColors.text.withValues(alpha: 0.7),
                            fontSize: 12,
                          ),
                        ),
                      );
                    } else if (value.toInt() == dataLength - 1) {
                      // Конец
                      final balanceData = data[dataLength - 1];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${balanceData.date.day}.${balanceData.date.month}',
                          style: TextStyle(
                            color: appColors.text.withValues(alpha: 0.7),
                            fontSize: 12,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  reservedSize: 30,
                ),
              ),
              leftTitles: const AxisTitles(
                
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: _createBarGroups(appColors),
            gridData: const FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  double _getMaxBalance() {
    if (data.isEmpty) return 100000;
    final maxBalance =
        data.map((e) => e.balance).reduce((a, b) => a > b ? a : b);
    return maxBalance * 1.1;
  }

  double _getMinBalance() {
    if (data.isEmpty) return 0;
    final minBalance =
        data.map((e) => e.balance).reduce((a, b) => a < b ? a : b);
    return minBalance * 0.9;
  }

  List<BarChartGroupData> _createBarGroups(AppColors appColors) {
    return data.asMap().entries.map((entry) {
      final index = entry.key;
      final balanceData = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: balanceData.balance,
            color: balanceData.isPositive ? appColors.primary : Colors.red,
            width: 8,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      );
    }).toList();
  }
}
