import 'package:flutter/material.dart';

class CrossPainter extends CustomPainter {
  CrossPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / 40;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = cellSize * 1.8;

    canvas.drawLine(
      Offset(cellSize * 14, cellSize * 14),
      Offset(cellSize * 26, cellSize * 26),
      paint,
    );
    canvas.drawLine(
      Offset(cellSize * 26, cellSize * 14),
      Offset(cellSize * 14, cellSize * 26),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
