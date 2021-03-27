import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class CrossPainter extends CustomPainter {
  final double percentage;
  double radius = 0;
  CrossPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    radius = math.min(size.height, size.width) / 2 - 10;
    var center = Offset(size.width / 2, size.height / 2);

    var crossAngle = (math.pi * 2) / 8;
    var crossAngle2 = crossAngle * 3;
    createPath(canvas, center, crossAngle, math.min(100, percentage * 2));
    createPath(canvas, center, crossAngle2, math.max(0, (percentage - 50) * 2));
  }

  void createPath(final Canvas canvas, final Offset center,
      final double startingAngle, final double percentage) {
    var paint = Paint()
      ..color = '#ffeced'.toColor()
      ..strokeWidth = 15;
    var angle = math.pi;

    var firstPoint = Offset(
        radius * (percentage / 100) * math.cos(startingAngle),
        radius * (percentage / 100) * math.sin(startingAngle));
    var secondPoint = Offset(
        radius * (percentage / 100) * math.cos(startingAngle + angle),
        radius * (percentage / 100) * math.sin(startingAngle + angle));
    var firstActualPoint =
        Offset(firstPoint.dx + center.dx, firstPoint.dy + center.dy);
    var secondActualPoint =
        Offset(secondPoint.dx + center.dx, secondPoint.dy + center.dy);
    canvas.drawLine(firstActualPoint, secondActualPoint, paint);
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
