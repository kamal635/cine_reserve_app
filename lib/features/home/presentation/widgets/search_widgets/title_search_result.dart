import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';

class TitleResultSearch extends StatelessWidget {
  const TitleResultSearch({super.key, required this.moviesEntity});
  final MoviesEntity moviesEntity;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        moviesEntity.titleMovie ?? "",
        style:
            AppFonts.regular_14.copyWith(color: AppColor.white.withAlpha(200)),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
