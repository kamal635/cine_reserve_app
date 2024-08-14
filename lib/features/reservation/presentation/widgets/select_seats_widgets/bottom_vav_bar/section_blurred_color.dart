import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/custom_blurred_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionBluredColor extends StatelessWidget {
  const SectionBluredColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -30,
      child: Row(
        children: [
          CustomPaint(
            painter: BlurredCirclePainter(
              colorCircle: AppColor.primary.withOpacity(0.5),
            ),
            child: SizedBox(
              height: 150.h,
              width: 200.w,
            ),
          ),
          CustomPaint(
            painter: BlurredCirclePainter(
              colorCircle: AppColor.tan.withOpacity(0.5),
            ),
            child: SizedBox(
              height: 150.h,
              width: 170.w,
            ),
          ),
          CustomPaint(
            painter: BlurredCirclePainter(
              colorCircle: AppColor.coralRed.withOpacity(0.5),
            ),
            child: SizedBox(
              height: 150.h,
              width: 180.w,
            ),
          ),
        ],
      ),
    );
  }
}
