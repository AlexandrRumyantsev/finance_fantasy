import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:finance_fantasy/presentation/components/components.dart';
import 'package:finance_fantasy/utils/colors.dart';

void main() {
  group('CustomDivider Golden Tests', () {
    testGoldens('CustomDivider variants', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [Device.phone])
        ..addScenario(
          widget: _buildTestScenario(),
          name: 'custom_divider_variants',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'custom_divider_variants');
    });

    testGoldens('CustomDivider with custom colors', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [Device.phone])
        ..addScenario(
          widget: _buildColorTestScenario(),
          name: 'custom_divider_colors',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'custom_divider_colors');
    });

    testGoldens('CustomDivider vertical variants', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [Device.phone])
        ..addScenario(
          widget: _buildVerticalTestScenario(),
          name: 'custom_divider_vertical',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'custom_divider_vertical');
    });
  });
}

Widget _buildTestScenario() {
  return MaterialApp(
    theme: _buildTestTheme(),
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Default Divider',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(),
            const SizedBox(height: 20),
            const Text('Divider with Padding',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(
              leftPadding: 20,
              rightPadding: 20,
              topPadding: 10,
              bottomPadding: 10,
            ),
            const SizedBox(height: 20),
            const Text('Thick Divider',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(
              thickness: 4,
            ),
            const SizedBox(height: 20),
            const Text('Hidden Divider (should be invisible)',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(
              isVisible: false,
              thickness: 4,
            ),
            const SizedBox(height: 20),
            const Text('Custom Color Divider',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(
              color: Colors.red,
              thickness: 2,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildColorTestScenario() {
  return MaterialApp(
    theme: _buildTestTheme(),
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Red Divider',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(color: Colors.red, thickness: 2),
            const SizedBox(height: 20),
            const Text('Blue Divider',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(color: Colors.blue, thickness: 2),
            const SizedBox(height: 20),
            const Text('Green Divider',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(color: Colors.green, thickness: 2),
            const SizedBox(height: 20),
            const Text('Purple Divider',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(color: Colors.purple, thickness: 2),
            const SizedBox(height: 20),
            const Text('Orange Divider',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const CustomDivider(color: Colors.orange, thickness: 2),
          ],
        ),
      ),
    ),
  );
}

Widget _buildVerticalTestScenario() {
  return MaterialApp(
    theme: _buildTestTheme(),
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Vertical Dividers',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.grey[200],
                  child: const Center(child: Text('A')),
                ),
                const CustomDivider(
                  isVertical: true,
                  thickness: 2,
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.grey[200],
                  child: const Center(child: Text('B')),
                ),
                const CustomDivider(
                  isVertical: true,
                  thickness: 4,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.grey[200],
                  child: const Center(child: Text('C')),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text('Vertical Dividers with Padding',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 40,
                  color: Colors.blue[100],
                  child: const Center(child: Text('1')),
                ),
                const CustomDivider(
                  isVertical: true,
                  thickness: 3,
                  color: Colors.blue,
                  leftPadding: 8,
                  rightPadding: 8,
                ),
                Container(
                  height: 80,
                  width: 40,
                  color: Colors.blue[100],
                  child: const Center(child: Text('2')),
                ),
                const CustomDivider(
                  isVertical: true,
                  thickness: 3,
                  color: Colors.blue,
                  leftPadding: 8,
                  rightPadding: 8,
                ),
                Container(
                  height: 80,
                  width: 40,
                  color: Colors.blue[100],
                  child: const Center(child: Text('3')),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

ThemeData _buildTestTheme() {
  return ThemeData(
    extensions: [
      AppColors.light(),
    ],
  );
}
