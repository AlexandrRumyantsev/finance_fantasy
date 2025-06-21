import 'package:flutter/material.dart';

class AppDatePickerTheme extends StatelessWidget {
  const AppDatePickerTheme({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        datePickerTheme: DatePickerThemeData(
          backgroundColor: const Color(0xFFD4FAE6),
          surfaceTintColor: const Color(0xFF2AE881),
          dividerColor: Colors.transparent,
          dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFF2AE881);
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
              return const Color(0xFF2AE881);
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
