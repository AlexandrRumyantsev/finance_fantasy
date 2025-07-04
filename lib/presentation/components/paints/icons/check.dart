import 'package:flutter/material.dart';

import '../painters/check_painter.dart';

class CheckIcon extends StatelessWidget {
  const CheckIcon({
    super.key,
    this.color = Colors.black,
    this.size = 40,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CheckPainter(color: color),
      size: Size(size, size),
    );
  }
}
