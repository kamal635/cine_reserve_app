import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/features/home/domain/entity/genre_string.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitleMovieAndGenreStrings extends StatelessWidget {
  const SectionTitleMovieAndGenreStrings({
    super.key,
    required this.moviesEntity,
  });
  final MoviesEntity moviesEntity;

  @override
  Widget build(BuildContext context) {
    GenreString genreString = GenreString();
    List<String?> listGenre =
        genreString.genreStringMethod(genreString, moviesEntity);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          kTitleMovie,
          style: AppFonts.regular_12.copyWith(color: AppColor.white),
        ),
        Text(
          moviesEntity.titleMovie ?? "",
          style: AppFonts.bold_16.copyWith(color: AppColor.white),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "$kGenre: ${listGenre.join(", ")}",
          style: AppFonts.regular_12.copyWith(color: AppColor.white),
        ),
      ],
    );
  }
}
