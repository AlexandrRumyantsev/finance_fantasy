import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'connection_warning.dart';
import 'logic/cubit.dart';

/// Анимированный виджет [ConnectionWarningWidget]
///
class ConnectionWarning extends StatefulWidget {
  /// Ф-ия скрытия виджета [ConnectionWarningWidget]
  final void Function() dismissWarning;

  const ConnectionWarning(
    this.dismissWarning, {
    super.key,
  });

  @override
  State<ConnectionWarning> createState() => _ConnectionWarningState();
}

/// Состояние предупреждения подключения
///
class _ConnectionWarningState extends State<ConnectionWarning>
    with SingleTickerProviderStateMixin {
  /// Контроллер анимации
  late final AnimationController _controller;

  /// Инициализируем контроллер и стартуем анимацию
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Durations.medium2,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    const warningHeight = 35;

    return BlocBuilder<ConnectionWarningCubit, ConnectionWarningState>(
      builder: (context, state) {
        final hasConnection = state.hasConnection;
        if (hasConnection) {
         Future.delayed(
            const Duration(seconds: 3),
            () => close(widget.dismissWarning),
          );
        }
        final child = switch (hasConnection) {
          false => ConnectionWarningWidget.disconnected(
              key: const ValueKey(false),
            ),
          true => ConnectionWarningWidget.connected(
              key: const ValueKey(true),
            ),
        };

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FractionalTranslation(
              translation: Offset(
                0,
                warningHeight / screenHeight * (1 - _controller.value),
              ),
              child: child,
            );
          },
          child: AnimatedSwitcher(
            duration: Durations.medium3,
            child: child,
          ),
        );
      },
    );
  }

  Future<void> close(void Function() dismissWarning) async {
    await _controller.reverse();
    dismissWarning();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
