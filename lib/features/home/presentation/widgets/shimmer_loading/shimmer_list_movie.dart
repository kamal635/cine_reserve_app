import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListMovie extends StatelessWidget {
  const ShimmerListMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: AppColor.secondry,
      child: SizedBox(
        height: 300.h,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            padding: EdgeInsets.only(left: 12.w),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 3.7,
            ),
            itemBuilder: (context, i) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Row(
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10.h,
                                  width: 120.w,
                                  color: AppColor.white,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Container(
                                  height: 10.h,
                                  width: 90.w,
                                  color: AppColor.white,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Container(
                                  height: 10.h,
                                  width: 60.w,
                                  color: AppColor.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
