import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/data/data_source/remote_data_source/search_home_remote.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/repository/search_home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchHomeRepoImpl implements SearchHomeRepo {
  final SearchHomeRemoteImpl searchHomeRemoteImpl;
  SearchHomeRepoImpl({required this.searchHomeRemoteImpl});

  @override
  Future<Either<Failure, List<MoviesEntity>>> fetchSearchMovies(
      String query) async {
    try {
      final results = await searchHomeRemoteImpl.fetchSearchHome(query);
      return right(results);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
