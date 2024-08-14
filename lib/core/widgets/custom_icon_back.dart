import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomIconBack extends StatelessWidget {
  const CustomIconBack({super.key, this.backgroundIcon});
  final Color? backgroundIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundIcon ?? AppColor.secondry.withOpacity(0.8),
      ),
      child: IconButton(
        splashColor: AppColor.secondry,
        highlightColor: AppColor.secondry,
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          AppIcon.arrowLeftUp,
          size: 25.h,
        ),
      ),
    );
  }
}
