import 'package:flutter/material.dart';

import 'colors.dart';

extension ThemeDataExtensions on ThemeData {
  /// Возвращает кастомную тему для DatePicker для светлой темы
  static DatePickerThemeData get lightDatePickerTheme {
    final appColors = AppColors.light();

    return DatePickerThemeData(
      backgroundColor: appColors.secondary,
      headerBackgroundColor: appColors.secondary,
      headerForegroundColor: appColors.text,
      dividerColor: Colors.transparent,
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        return appColors.text;
      }),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return appColors.primary;
        }
        return null;
      }),
      todayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return appColors.text;
      }),
      todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return appColors.primary;
        }
        return null;
      }),
      todayBorder: BorderSide.none,
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: appColors.text,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: appColors.text,
      ),
    );
  }

  /// Возвращает кастомную тему для DatePicker для темной темы
  static DatePickerThemeData get darkDatePickerTheme {
    final appColors = AppColors.dark();

    return DatePickerThemeData(
      backgroundColor: appColors.secondary,
      headerBackgroundColor: appColors.secondary,
      headerForegroundColor: appColors.text,
      dividerColor: Colors.transparent,
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        return appColors.text;
      }),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return appColors.primary;
        }
        return null;
      }),
      todayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return appColors.text;
      }),
      todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return appColors.primary;
        }
        return null;
      }),
      todayBorder: BorderSide.none,
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: appColors.text,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: appColors.text,
      ),
    );
  }

  /// Возвращает кастомную тему для TimePicker для светлой темы
  static TimePickerThemeData get lightTimePickerTheme {
    final appColors = AppColors.light();

    return TimePickerThemeData(
      backgroundColor: appColors.secondary,
      hourMinuteTextColor: appColors.text,
      hourMinuteColor: Colors.transparent,
      dayPeriodTextColor: appColors.text,
      dayPeriodColor: Colors.transparent,
      dialHandColor: appColors.primary,
      dialBackgroundColor: appColors.secondary,
      dialTextColor: appColors.text,
      entryModeIconColor: appColors.text,
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: appColors.text,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: appColors.text,
      ),
    );
  }

  /// Возвращает кастомную тему для TimePicker для темной темы
  static TimePickerThemeData get darkTimePickerTheme {
    final appColors = AppColors.dark();

    return TimePickerThemeData(
      backgroundColor: appColors.secondary,
      hourMinuteTextColor: appColors.text,
      hourMinuteColor: Colors.transparent,
      dayPeriodTextColor: appColors.text,
      dayPeriodColor: Colors.transparent,
      dialHandColor: appColors.primary,
      dialBackgroundColor: appColors.secondary,
      dialTextColor: appColors.text,
      entryModeIconColor: appColors.text,
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: appColors.text,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: appColors.text,
      ),
    );
  }
}
