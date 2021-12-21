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
    final _center = Offset(size.width / 2, size.height / 2);

    const _crossAngle = (math.pi * 2) / 8;
    const _crossAngle2 = _crossAngle * 3;

    createPath(canvas, _center, _crossAngle, math.min(100, percentage * 2));
    createPath(
      canvas,
      _center,
      _crossAngle2,
      math.max(0, (percentage - 50) * 2),
    );
  }

  void createPath(
    final Canvas canvas,
    final Offset center,
    final double startingAngle,
    final double percentage,
  ) {
    final paint = Paint()
      ..color = '#ffeced'.toColor()
      ..strokeWidth = 15;
    const angle = math.pi;

    final firstPoint = Offset(
      radius * (percentage / 100) * math.cos(startingAngle),
      radius * (percentage / 100) * math.sin(startingAngle),
    );
    final secondPoint = Offset(
      radius * (percentage / 100) * math.cos(startingAngle + angle),
      radius * (percentage / 100) * math.sin(startingAngle + angle),
    );
    final firstActualPoint =
        Offset(firstPoint.dx + center.dx, firstPoint.dy + center.dy);
    final secondActualPoint =
        Offset(secondPoint.dx + center.dx, secondPoint.dy + center.dy);
    canvas.drawLine(firstActualPoint, secondActualPoint, paint);
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
