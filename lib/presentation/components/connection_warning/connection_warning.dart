import 'package:flutter/material.dart';

/// Типы состояний соединения
///
enum ConnectionWarningType {
  /// Нет соединения
  notConnected,

  /// Соединение восстановлено
  connected,
}

/// Абстрактный виджет для отображения состояния соединения
///
abstract class ConnectionWarningWidget extends StatelessWidget {
  factory ConnectionWarningWidget.connected({
    Key? key,
  }) =>
      _ConnectionWarning(
        key: key,
        color: Colors.green,
        title: 'Соединение восстановлено',
      );

  factory ConnectionWarningWidget.disconnected({
    Key? key,
  }) =>
      _ConnectionWarning(
        key: key,
        color: Colors.black,
        title: 'Нет соединения',
      );

  const ConnectionWarningWidget._({
    super.key,
  });
}

/// Виджет для отображения состояния соединения с версткой
///
class _ConnectionWarning extends ConnectionWarningWidget {
  /// Цвет
  final Color color;

  /// Заголовок
  final String title;

  const _ConnectionWarning({
    super.key,
    required this.color,
    required this.title,
  }) : super._();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ColoredBox(
            color: color,
            child: SizedBox(
              height: 35,
              width: double.infinity,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
