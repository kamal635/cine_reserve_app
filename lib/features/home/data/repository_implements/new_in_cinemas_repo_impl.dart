import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/data/data_source/remote_data_source/new_in_cinema_remote_data_source.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/repository/new_in_cinemas_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NowInCinemasRepoImpl implements NowInCinemasRepo {
  final NowInCinemasRemoteImpl newInCinemasRemoteImpl;

  NowInCinemasRepoImpl({required this.newInCinemasRemoteImpl});
  @override
  Future<Either<Failure, List<MoviesEntity>>> fetchNowInCinemas(
      {int page = 1}) async {
    try {
      final data = await newInCinemasRemoteImpl.getNowInCinemas(page: page);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
