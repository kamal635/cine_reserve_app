import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRowCarousel extends StatelessWidget {
  const ShimmerRowCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: AppColor.secondry,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                  height: 40.h,
                  width: 50.w,
                  child: Container(
                    color: AppColor.white,
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10.h,
                    width: 40.w,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 10.h,
                    width: 60.w,
                    color: AppColor.white,
                  ),
                ],
              ),
            ),
            Container(
              height: 38.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
