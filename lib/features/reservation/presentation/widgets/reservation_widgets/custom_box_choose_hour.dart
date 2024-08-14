import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBoxChooseHour extends StatelessWidget {
  const CustomBoxChooseHour({
    super.key,
    required this.alignment,
    required this.hour,
    this.onTap,
    this.isTapHour = false,
  });
  final AlignmentGeometry alignment;
  final String hour;
  final Function()? onTap;
  final bool isTapHour;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: FractionallySizedBox(
        widthFactor: 65.w / MediaQuery.of(context).size.width,
        heightFactor: 35.h / 150.h,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: isTapHour
                    ? AppLinear.linearButton
                    : AppLinear.linearReservation,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.lightBlue,
                    offset: Offset(-1, -1),
                  )
                ]),
            child: Text(
              hour,
              style: AppFonts.regular_16.copyWith(color: AppColor.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
