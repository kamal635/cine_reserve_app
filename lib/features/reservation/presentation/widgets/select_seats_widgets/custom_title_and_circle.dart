import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleAndCircle extends StatelessWidget {
  const CustomTitleAndCircle(
      {super.key, required this.title, required this.backgroundColor});
  final String title;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8.r,
          backgroundColor: backgroundColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          title,
          style: AppFonts.regular_16.copyWith(color: AppColor.white),
        ),
      ],
    );
  }
}
