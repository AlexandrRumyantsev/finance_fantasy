import 'package:flutter/material.dart';

import '../painters/chevron_painter.dart';

class ChevronRight extends StatelessWidget {
  const ChevronRight({
    super.key,
    this.size = 24,
    this.color = Colors.grey,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: ChevronRightPainter(color: color),
    );
  }
}
