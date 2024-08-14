import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTitleList extends StatelessWidget {
  const ShimmerTitleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: AppColor.secondry,
      child: Container(
        margin: EdgeInsets.only(left: 20.w),
        height: 10.h,
        width: 60.w,
        color: AppColor.white,
      ),
    );
  }
}
