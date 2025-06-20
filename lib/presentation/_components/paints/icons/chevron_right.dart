import 'package:flutter/material.dart';

import '../chevron_painter.dart';

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
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: ChevronRightPainter(sizeIcon: size, color: color)),
    );
  }
}
