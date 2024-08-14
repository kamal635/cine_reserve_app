import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBoxChooseDay extends StatelessWidget {
  const CustomBoxChooseDay({
    super.key,
    required this.alignment,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.isTapDay = false,
  });
  final AlignmentGeometry alignment;
  final String title;
  final String subTitle;
  final Function()? onTap;
  final bool isTapDay;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: FractionallySizedBox(
        widthFactor: 65.w / MediaQuery.of(context).size.width,
        heightFactor: 45.h / 150.h,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: isTapDay
                    ? AppLinear.linearButton
                    : AppLinear.linearReservation,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.lightBlue,
                    offset: Offset(-1, -1),
                  )
                ]),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                title,
                style: AppFonts.regular_16.copyWith(color: AppColor.white),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                subTitle,
                style: AppFonts.regular_16.copyWith(color: AppColor.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
