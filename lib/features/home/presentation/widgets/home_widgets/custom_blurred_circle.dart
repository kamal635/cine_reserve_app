import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurredCircle extends StatelessWidget {
  const BlurredCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomPaint(
              painter: BlurredCirclePainter(
                  colorCircle: AppColor.coralRed.withAlpha(178)),
              child: SizedBox(
                width: 150.w,
                height: 300.h,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomPaint(
              painter: BlurredCirclePainter(
                  colorCircle: AppColor.tan.withAlpha(178)),
              child: SizedBox(
                width: 300.w,
                height: 100.h,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class BlurredCirclePainter extends CustomPainter {
  const BlurredCirclePainter({required this.colorCircle});
  final Color colorCircle;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorCircle
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 40.0);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 1.3;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(BlurredCirclePainter oldDelegate) => false;
}
