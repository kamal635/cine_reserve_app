import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsCarousel extends StatelessWidget {
  const DotsCarousel(
      {super.key, required this.listOfThreeMovies, required this.indexList});
  final List<MoviesEntity> listOfThreeMovies;
  final int indexList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(listOfThreeMovies.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CircleAvatar(
              radius: 4.r,
              backgroundColor: index == indexList
                  ? AppColor.white
                  : AppColor.white.withAlpha(86),
            ),
          );
        }),
      ],
    );
  }
}
