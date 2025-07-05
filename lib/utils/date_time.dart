import 'package:flutter/material.dart';

extension DateTimeExtensions on DateTime {
  /// Форматирует дату в строку формата ДД.ММ.ГГГГ
  String toDateString() {
    final dayStr = day.toString().padLeft(2, '0');
    final monthStr = month.toString().padLeft(2, '0');
    final yearStr = year.toString();
    return '$dayStr.$monthStr.$yearStr';
  }

  /// Форматирует время в строку формата ЧЧ:MM
  String toTimeString() {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }

  /// Форматирует дату и время в строку формата ДД.ММ.ГГГГ ЧЧ:MM
  String toDateTimeString() {
    return '${toDateString()} ${toTimeString()}';
  }
}

extension TimeOfDayExtensions on TimeOfDay {
  String toTimeString() {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }
}
