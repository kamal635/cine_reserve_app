import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/utils/api_service.dart';
import 'package:cine_reserve_app/features/home/data/models/movie_model.dart';

abstract class UpComingMoviesRemote {
  Future<List<MoviesModel>> getUpComingMovies({int page = 1});
}

class UpComingMoviesRemoteImple implements UpComingMoviesRemote {
  final ApiService apiService;

  UpComingMoviesRemoteImple({required this.apiService});
  @override
  Future<List<MoviesModel>> getUpComingMovies({int page = 1}) async {
    Map<String, dynamic> data =
        await apiService.get(endPoint: "$kEndPointsUpComing$page");

    List<MoviesModel> listMovies = [];

    for (var movie in data[kResults]) {
      listMovies.add(MoviesModel.fromJson(movie));
    }
    return listMovies;
  }
}
