import 'package:cine_reserve_app/core/constant/app_assets_icons.dart';
import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionInfoSeats extends StatelessWidget {
  const SectionInfoSeats({
    super.key,
    required this.seats,
  });
  final List seats;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          AppAssetsIcons.ticket,
          height: 20.h,
          width: 20.w,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          "VIP Section",
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
          width: 125.w,
          child: Text(
            "Seats ${seats.join(", ")},",
            style: AppFonts.regular_14.copyWith(color: AppColor.white),
          ),
        )
      ],
    );
  }
}
