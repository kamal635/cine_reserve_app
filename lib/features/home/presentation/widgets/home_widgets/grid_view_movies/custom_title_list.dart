import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleListViewHome extends StatelessWidget {
  const TitleListViewHome({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Text(
        title,
        style: AppFonts.bold_18.copyWith(
          color: AppColor.white.withAlpha(219),
        ),
      ),
    );
  }
}
