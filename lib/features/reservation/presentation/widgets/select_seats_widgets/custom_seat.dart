import 'package:cine_reserve_app/core/constant/app_assets_icons.dart';
import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSeat extends StatelessWidget {
  const CustomSeat({super.key, this.onTap, this.color});
  final Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          AppAssetsIcons.seat,
          color: color ?? AppColor.white,
          height: 22.h,
          width: 28.w,
        ),
      ),
    );
  }
}
