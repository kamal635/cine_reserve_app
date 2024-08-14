import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_reserve_app/features/home/domain/entity/genre_string.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/new_in_cinemas/new_in_cinemas_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/caousel_widgets/button_with_title_carousel.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/caousel_widgets/dots_carousel.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/caousel_widgets/image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselHome extends StatefulWidget {
  const CustomCarouselHome({super.key});

  @override
  State<CustomCarouselHome> createState() => _CustomCarouselHomeState();
}

int indexList = 0;

class _CustomCarouselHomeState extends State<CustomCarouselHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowInCinemasBloc, NowInCinemasState>(
      builder: (context, state) {
        List<MoviesEntity> listOfThreeMovies = (state is NowInCinemasSuccess)
            ? state.listMovie.sublist(4, 15)
            : [];

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 3 / 1.65,
                viewportFraction: 1,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlay: true,
                onPageChanged: (i, _) {
                  setState(() {
                    indexList = i;
                  });
                },
              ),
              items: listOfThreeMovies
                  .map((movieEntity) => Builder(builder: (context) {
                        GenreString genre = GenreString();
                        List<String?> genreString =
                            genre.genreStringMethod(genre, movieEntity);
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              ImageCarousel(moviesEntity: movieEntity),
                              SizedBox(
                                height: 5.h,
                              ),
                              ButtonWithTitleCarousel(
                                moviesEntity: movieEntity,
                                genreString: genreString,
                              )
                            ],
                          ),
                        );
                      }))
                  .toList(),
            ),
            DotsCarousel(
              indexList: indexList,
              listOfThreeMovies: listOfThreeMovies,
            )
          ],
        );
      },
    );
  }
}
