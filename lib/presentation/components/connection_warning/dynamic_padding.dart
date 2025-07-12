import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit.dart';

/// Виджет для создания динамического отступа снизу
/// в момент когда показывается предупреждение об отсутствии интернета
///
class DynamicPadding extends StatefulWidget {
  /// Дочерний виджет
  final Widget child;

  const DynamicPadding({
    super.key,
    required this.child,
  });

  @override
  State<DynamicPadding> createState() => _DynamicPaddingState();
}

/// [_DynamicPaddingState] - состояние виджета
///
class _DynamicPaddingState extends State<DynamicPadding>
    with SingleTickerProviderStateMixin {
  /// Контроллер анимации
  late final AnimationController _controller;

  /// Иницализация контроллера
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Durations.medium2,
    );
    final isConnected =
        context.read<ConnectionWarningCubit>().state.hasConnection;
    if (!isConnected) _controller.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionWarningCubit, ConnectionWarningState>(
      listener: (context, state) {
        if (state.hasConnection == true) {
          Future.delayed(
            const Duration(seconds: 3),
            _controller.reverse,
          );
        } else {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final currentPadding = 35 * _controller.value;
          return Padding(
            padding: EdgeInsets.only(bottom: currentPadding),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
