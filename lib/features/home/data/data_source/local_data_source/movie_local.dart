import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class MovieLocalDataSourceImpl {
  static Future<void> addMovie(MoviesEntity moviesEntity) async {
    await Hive.box(kMovieBox).put(moviesEntity.idMovie, moviesEntity);
  }

  static List<MoviesEntity> getMovie() {
    return Hive.box(kMovieBox).values.toList().cast();
  }
}
