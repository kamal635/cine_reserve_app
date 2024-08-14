import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/data/data_source/remote_data_source/up_coming_movies_remote.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/repository/up_coming_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UpComingMoviesRepoImpl implements UpComingMoviesReop {
  final UpComingMoviesRemoteImple upComingMoviesRemoteImple;
  UpComingMoviesRepoImpl({required this.upComingMoviesRemoteImple});

  @override
  Future<Either<Failure, List<MoviesEntity>>> fetchUpComingMovies(
      {int page = 1}) async {
    try {
      final movies =
          await upComingMoviesRemoteImple.getUpComingMovies(page: page);
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
