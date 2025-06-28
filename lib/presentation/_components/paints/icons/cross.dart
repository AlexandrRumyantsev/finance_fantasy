import 'package:flutter/material.dart';

import '../painters/cross_painter.dart';

class CrossIcon extends StatelessWidget {
  const CrossIcon({
    super.key,
    this.color = Colors.black,
    this.size = 40,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: CrossPainter(color: color),
    );
  }
}
