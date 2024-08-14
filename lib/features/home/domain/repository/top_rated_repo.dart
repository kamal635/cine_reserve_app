import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TopRatedMoviesRepo {
  Future<Either<Failure, List<MoviesEntity>>> fetchTopRatedMovies(
      {int page = 1});
}
