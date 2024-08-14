import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton(
      {super.key, required this.title, this.onPressed, this.textStyle});
  final String title;
  final Function()? onPressed;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppLinear.linearButton,
          borderRadius: BorderRadius.circular(10.r)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: textStyle ??
                AppFonts.semiBold_18.copyWith(color: AppColor.white),
          )),
    );
  }
}
