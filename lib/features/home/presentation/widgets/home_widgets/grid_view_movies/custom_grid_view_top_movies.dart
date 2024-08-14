import 'package:cine_reserve_app/core/utils/router.dart';
import 'package:cine_reserve_app/features/home/domain/entity/genre_string.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/grid_view_movies/custom_card_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomGridViewTopRated extends StatelessWidget {
  const CustomGridViewTopRated({
    super.key,
    required this.scrollController,
    required this.listPagination,
  });

  final ScrollController scrollController;
  final List<MoviesEntity> listPagination;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: listPagination.length,
        padding: EdgeInsets.only(left: 12.w),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 3.7,
        ),
        itemBuilder: (context, i) {
          GenreString genre = GenreString();
          List<String?> genreString =
              genre.genreStringMethod(genre, listPagination[i]);
          return InkWell(
            onTap: () {
              context.push(AppRouter.reservationView, extra: listPagination[i]);
            },
            child: CustomCardMovie(
                genreString: genreString, moviesEntity: listPagination[i]),
          );
        });
  }
}
