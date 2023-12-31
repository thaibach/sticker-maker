import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFDE225B),
          Color(0xFFE46D39),
        ],
      ).createShader(Rect.fromCircle(
        center: Offset.zero,
        radius: 250.0,
      ));
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.08) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.4) * size.width,
        size.height * 0.01,
        (loc + s * 0.08) * size.width,
        size.height * 0.39,
        (loc + s * 0.50) * size.width,
        size.height * 0.51,
      )
      ..cubicTo(
        (loc + s) * size.width - 3,
        size.height * 0.60 - 5,
        (loc + s - s * 0.25) * size.width - 6,
        size.height * 0.05 - 9,
        (loc + s + 0.1) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
