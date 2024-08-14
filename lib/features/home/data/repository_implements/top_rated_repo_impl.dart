import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/data/data_source/remote_data_source/top_rated_movies_remote.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/repository/top_rated_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TopRatedMoviesRepoImpl implements TopRatedMoviesRepo {
  final TopRatedMoviesRemoteImple topRatedMoviesRemoteImple;
  TopRatedMoviesRepoImpl({required this.topRatedMoviesRemoteImple});

  @override
  Future<Either<Failure, List<MoviesEntity>>> fetchTopRatedMovies(
      {int page = 1}) async {
    try {
      final movies =
          await topRatedMoviesRemoteImple.getTopRatedMovies(page: page);
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
