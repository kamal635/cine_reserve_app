import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import "dart:math" as math;

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(-140, -30, 140, 40);
    const startAngle = math.pi;
    const sweepAngle = math.pi;
    const useCenter = false;
    final paint = Paint()
      ..color = AppColor.lightBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyPainterBlur extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(-140, -30, 140, 40);
    const startAngle = math.pi;
    const sweepAngle = math.pi;
    const useCenter = false;
    final paint = Paint()
      ..color = AppColor.lightBlue
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6.0)
      ..strokeWidth = 7;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
