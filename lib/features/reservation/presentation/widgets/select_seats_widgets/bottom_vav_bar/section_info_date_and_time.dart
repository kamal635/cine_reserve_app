import 'package:cine_reserve_app/core/constant/app_assets_icons.dart';
import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionInfoDateAndTime extends StatelessWidget {
  const SectionInfoDateAndTime({
    super.key,
    required this.day,
    required this.dayNumber,
    required this.hour,
  });
  final String day;
  final String dayNumber;
  final String hour;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          AppAssetsIcons.calendar,
          height: 20.h,
          width: 20.w,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          "$day, June $dayNumber, 2023",
          style: AppFonts.regular_14.copyWith(color: AppColor.white),
        ),
        SizedBox(
          width: 6.w,
        ),
        CircleAvatar(
          radius: 4.r,
          backgroundColor: AppColor.white,
        ),
        SizedBox(
          width: 6.w,
        ),
        SizedBox(
          width: 90.w,
          child: Text(
            "$hour pm",
            style: AppFonts.regular_14.copyWith(color: AppColor.white),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
