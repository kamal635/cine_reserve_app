import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/shimmer_loading/shimmer_carusel.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/shimmer_loading/shimmer_dots.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/shimmer_loading/shimmer_list_movie.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/shimmer_loading/shimmer_row_carousel.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/shimmer_loading/shimmer_title_list.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/shimmer_loading/shimmer_title_with_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerLoadingHome extends StatelessWidget {
  const ShimmerLoadingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: AppLinear.linearPages,
      ),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                //here i put all body home above blurredCircle
                Stack(
                  children: [
                    // const BlurredCircle(),
                    Column(
                      children: [
                        const ShimmerTitleWithTextField(),
                        SizedBox(
                          height: 7.h,
                        ),
                        const ShimmerCarusel(),
                        SizedBox(
                          height: 5.h,
                        ),
                        const ShimmerRowCarousel(),
                        SizedBox(
                          height: 7.h,
                        ),
                        const ShimmerDots(),
                        SizedBox(
                          height: 7.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ShimmerTitleList(),
                            SizedBox(
                              height: 10.h,
                            ),
                            const ShimmerListMovie(),
                            SizedBox(
                              height: 10.h,
                            ),
                            const ShimmerTitleList(),
                            SizedBox(
                              height: 10.h,
                            ),
                            const ShimmerListMovie(),
                            SizedBox(
                              height: 10.h,
                            ),
                            const ShimmerTitleList(),
                            SizedBox(
                              height: 10.h,
                            ),
                            const ShimmerListMovie(),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
