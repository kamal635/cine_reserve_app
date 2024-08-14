import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({required this.holeRadius});

  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
//For left side shape of container
      ..lineTo(0.0, size.height - 100.h - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - 100.h),
        clockwise: true,
        radius: const Radius.circular(1),
      )

//For Right side shape of container
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - 100.h)
      ..arcToPoint(
        Offset(size.width, size.height - 100.h - holeRadius),
        clockwise: true,
        radius: const Radius.circular(1),
      );

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TicketClipper oldClipper) => true;
}
