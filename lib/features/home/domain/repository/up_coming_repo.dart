import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UpComingMoviesReop {
  Future<Either<Failure, List<MoviesEntity>>> fetchUpComingMovies(
      {int page = 1});
}
