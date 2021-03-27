import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class CirclePainter extends CustomPainter {
  double outerBorder = 15;
  double percentage = 0;

  CirclePainter(this.percentage);

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var radius = min(size.height, size.width) / 2 - 10;
    var center = Offset(size.width / 2, size.height / 2);
    var outerRect =
        Rect.fromCircle(center: center, radius: radius - (outerBorder) / 2);
    canvas.drawArc(
        outerRect,
        1.5 * pi,
        2 * pi * (percentage / 100),
        false,
        Paint()
          ..color = '#edecff'.toColor()
          ..strokeWidth = outerBorder
          ..style = PaintingStyle.stroke);
  }
}
