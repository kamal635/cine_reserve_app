import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_reserve_app/core/constant/app_assets.dart';
import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/utils/router.dart';
import 'package:cine_reserve_app/core/widgets/custom_elvaited_button.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ButtonWithTitleCarousel extends StatelessWidget {
  const ButtonWithTitleCarousel(
      {super.key, required this.moviesEntity, required this.genreString});
  final MoviesEntity moviesEntity;
  final List<String?> genreString;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: SizedBox(
              height: 50.h,
              width: 50.w,
              child: CachedNetworkImage(
                imageUrl: "$kBaseImage${moviesEntity.posterPathMovie}",
                placeholder: (context, url) => Image.asset(
                  AppAssets.loadedImage,
                  color: AppColor.white,
                  height: 25.h,
                  width: 25.w,
                ),
                fit: BoxFit.fill,
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
              Text(
                moviesEntity.titleMovie!,
                style: AppFonts.bold_14.copyWith(color: AppColor.white),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                genreString.join(", "),
                style: AppFonts.regular_10
                    .copyWith(color: AppColor.white.withAlpha(150)),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: SizedBox(
            height: 40.h,
            child: CustomElvatedButton(
              textStyle: AppFonts.semiBold_12,
              title: kShow,
              onPressed: () {
                context.push(AppRouter.reservationView, extra: moviesEntity);
              },
            ),
          ),
        )
      ],
    );
  }
}
