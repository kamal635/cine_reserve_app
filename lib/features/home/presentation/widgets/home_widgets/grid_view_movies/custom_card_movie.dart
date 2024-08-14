import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_reserve_app/core/constant/app_assets.dart';
import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardMovie extends StatelessWidget {
  const CustomCardMovie(
      {super.key, required this.moviesEntity, required this.genreString});
  final MoviesEntity moviesEntity;
  final List<String?> genreString;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            height: 60.h,
            width: 60.w,
            child: CachedNetworkImage(
              imageUrl: "$kBaseImage${moviesEntity.posterPathMovie}",
              fit: BoxFit.fill,
              placeholder: (context, url) => Image.asset(
                AppAssets.loadedImage,
                color: AppColor.white,
                height: 30.h,
                width: 30.w,
              ),
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 120.w,
                child: Text(
                  moviesEntity.titleMovie!,
                  style: AppFonts.regular_14
                      .copyWith(color: AppColor.white.withAlpha(219)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120.w,
                child: Text(
                  genreString.join(", "),
                  style: AppFonts.regular_12
                      .copyWith(color: AppColor.white.withAlpha(150)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(
                "vote: ${moviesEntity.voteAverageMovie}",
                style: AppFonts.regular_12
                    .copyWith(color: AppColor.white.withAlpha(150)),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
