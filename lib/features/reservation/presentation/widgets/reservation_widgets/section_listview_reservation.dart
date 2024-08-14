import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/reservation_widgets/section_description.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/reservation_widgets/section_list_choose_day_and_hour.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/reservation_widgets/section_title_movie_and_release.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionListViewReservation extends StatelessWidget {
  const SectionListViewReservation({Key? key, required this.moviesEntity})
      : super(key: key);
  final MoviesEntity moviesEntity;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SectionTitleMovieAndGenreStrings(moviesEntity: moviesEntity),
        SizedBox(
          height: 10.h,
        ),
        SectionDescription(moviesEntity: moviesEntity),
        SizedBox(
          height: 15.h,
        ),
        SectionListChooseDayAndHour(
          moviesEntity: moviesEntity,
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
