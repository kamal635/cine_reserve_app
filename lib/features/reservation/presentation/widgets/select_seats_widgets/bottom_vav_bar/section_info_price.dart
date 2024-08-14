import 'package:cine_reserve_app/core/constant/app_assets_icons.dart';
import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionInfoPrice extends StatelessWidget {
  const SectionInfoPrice({
    super.key,
    required this.numberSeats,
    required this.priceSeats,
  });
  final int numberSeats;
  final int priceSeats;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          AppAssetsIcons.cart,
          height: 20.h,
          width: 20.w,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          "Total $numberSeats : USD $priceSeats",
          style: AppFonts.regular_14.copyWith(color: AppColor.white),
        ),
      ],
    );
  }
}
