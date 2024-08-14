import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/utils/api_service.dart';
import 'package:cine_reserve_app/features/home/data/models/movie_model.dart';

abstract class NowInCinemasRemote {
  Future<List<MoviesModel>> getNowInCinemas({int page = 1});
}

class NowInCinemasRemoteImpl implements NowInCinemasRemote {
  final ApiService apiService;
  NowInCinemasRemoteImpl({required this.apiService});

  @override
  Future<List<MoviesModel>> getNowInCinemas({int page = 1}) async {
    Map<String, dynamic> data =
        await apiService.get(endPoint: "$kEndPointsNowInCinemas$page");

    List<MoviesModel> listMovies = [];

    for (var movie in data[kResults]) {
      listMovies.add(MoviesModel.fromJson(movie));
    }
    return listMovies;
  }
}
