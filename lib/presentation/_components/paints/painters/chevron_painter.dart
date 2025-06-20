import 'package:flutter/material.dart';

class ChevronRightPainter extends CustomPainter {
  /// Цвет
  final Color color;

  ChevronRightPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / 24;
    final dyCenter = size.height / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = cellSize * 1.8;

    canvas.drawLine(Offset(cellSize * 11, cellSize * 7),
        Offset(cellSize * 16, dyCenter), paint);
    canvas.drawLine(Offset(cellSize * 16, dyCenter),
        Offset(cellSize * 11, cellSize * 17), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
