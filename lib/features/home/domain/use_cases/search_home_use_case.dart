import 'package:cine_reserve_app/core/utils/failure.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/repository/search_home_repo.dart';
import 'package:dartz/dartz.dart';

class SearchHomeUseCase {
  final SearchHomeRepo searchHomeRepo;
  SearchHomeUseCase({required this.searchHomeRepo});

  Future<Either<Failure, List<MoviesEntity>>> getSearchHome(
      String query) async {
    return await searchHomeRepo.fetchSearchMovies(query);
  }
}
