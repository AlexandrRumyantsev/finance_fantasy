import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

/// Прототип графика
class BankAccountChart extends StatelessWidget {
  const BankAccountChart({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      height: 233,
      child: BarChart(
        BarChartData(
          backgroundColor: const Color(0xFFFDF6FF),
          barGroups: _buildBarGroups(appColors),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: _bottomTitles,
                reservedSize: 28,
              ),
            ),
            leftTitles: const AxisTitles(
              
            ),
            topTitles: const AxisTitles(
              
            ),
            rightTitles: const AxisTitles(
              
            ),
          ),
          gridData: const FlGridData(show: false),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(AppColors appColors) {
    final values = [
      7.0,
      4.0,
      6.0,
      3.0,
      9.0,
      2.0,
      10.0,
      5.0,
      4.0,
      7.0,
      1.0,
      2.0,
      3.0,
      8.0,
      6.0,
      5.0,
      2.0,
      7.0,
      3.0,
      0.5,
      0.8,
      1.0,
      1.2,
      1.4,
      1.1,
      0.9,
      1.3,
      1.5,
      1.4,
      1.2,
    ];

    return List.generate(values.length, (index) {
      final isGreen = index >= 20;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: values[index],
            width: 6,
            color: isGreen ? appColors.primary : const Color(0xFFFF5F00),
            borderRadius: BorderRadius.circular(2),
          ),
        ],
      );
    });
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontSize: 10,
    );

    // Пример подписей как на изображении
    if (value == 0) {
      return const Text('01.02', style: style);
    } else if (value == 10) {
      return const Text('14.01', style: style);
    } else if (value == 20) {
      return const Text('28.02', style: style);
    } else {
      return const SizedBox.shrink();
    }
  }
}
