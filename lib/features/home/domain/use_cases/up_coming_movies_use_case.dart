import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/repository/up_coming_repo.dart';
import 'package:dartz/dartz.dart';

class UpComingMoviesUseCase {
  final UpComingMoviesReop upComingMoviesReop;

  UpComingMoviesUseCase({required this.upComingMoviesReop});

  Future<Either<Failure, List<MoviesEntity>>> getUpComingMovies(
      {int page = 1}) async {
    return await upComingMoviesReop.fetchUpComingMovies(page: page);
  }
}
