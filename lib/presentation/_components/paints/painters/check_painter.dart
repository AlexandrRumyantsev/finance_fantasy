import 'package:flutter/material.dart';

class CheckPainter extends CustomPainter {
  final Color color;

  CheckPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / 40;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = cellSize * 1.8;

    canvas.drawLine(
      Offset(cellSize * 14, cellSize * 20),
      Offset(cellSize * 20, cellSize * 26),
      paint,
    );
    canvas.drawLine(
      Offset(cellSize * 20, cellSize * 26),
      Offset(cellSize * 32, cellSize * 14),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
