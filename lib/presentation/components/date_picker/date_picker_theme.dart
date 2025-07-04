import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AppDatePickerTheme extends StatelessWidget {
  const AppDatePickerTheme({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Theme(
      data: Theme.of(context).copyWith(
        datePickerTheme: DatePickerThemeData(
          backgroundColor: appColors.secondary,
          surfaceTintColor: appColors.primary,
          dividerColor: Colors.transparent,
          dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return appColors.primary;
            }
            return null;
          }),
          dayForegroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey;
            }
            return Colors.black;
          }),
          todayForegroundColor: WidgetStateProperty.all<Color>(Colors.black),
          todayBorder: BorderSide.none,
          todayBackgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return appColors.primary;
            } else {
              return Colors.transparent;
            }
          }),
          dayShape: WidgetStateProperty.all<OutlinedBorder>(
            const CircleBorder(),
          ),
          rangePickerHeaderForegroundColor: Colors.black,
          cancelButtonStyle: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.black),
          ),
          confirmButtonStyle: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.black),
          ),
          dayStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      child: child,
    );
  }
}
