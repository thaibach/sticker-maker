import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class OverlayPainter extends CustomPainter {
  ui.Image mask;
  ui.Image image;

  OverlayPainter(this.mask, this.image) : super();
  List<Offset> temp = [];

  @override
  void paint(Canvas canvas, ui.Size size) {
    Paint mainPaint = Paint();

    canvas.saveLayer(Offset.zero & size, mainPaint);
    canvas.drawImage(mask, Offset.zero, mainPaint);

    canvas.drawImage(
        image, Offset.zero, mainPaint..blendMode = BlendMode.srcIn);

    canvas.restore();
  }

  @override
  bool shouldRepaint(OverlayPainter oldDelegate) => true;
}
