import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTitleWithTextField extends StatelessWidget {
  const ShimmerTitleWithTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: AppColor.secondry,
      child: Column(
        children: [
          Container(
            color: AppColor.white,
            height: 14.h,
            width: 100.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColor.white),
              height: 36.h,
              width: double.infinity),
        ],
      ),
    );
  }
}
