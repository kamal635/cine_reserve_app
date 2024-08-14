import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/repository/new_in_cinemas_repo.dart';
import 'package:dartz/dartz.dart';

class NowInCinemasUseCase {
  final NowInCinemasRepo nowInCinemasRepo;

  NowInCinemasUseCase({required this.nowInCinemasRepo});

  Future<Either<Failure, List<MoviesEntity>>> getNowInCinemas(
      {int page = 1}) async {
    return await nowInCinemasRepo.fetchNowInCinemas(page: page);
  }
}
