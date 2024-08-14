import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/utils/api_service.dart';
import 'package:cine_reserve_app/features/home/data/models/movie_model.dart';

abstract class SearchHomeRemote {
  Future<List<MoviesModel>> fetchSearchHome(String query);
}

class SearchHomeRemoteImpl implements SearchHomeRemote {
  final ApiService apiService;
  SearchHomeRemoteImpl({required this.apiService});

  @override
  Future<List<MoviesModel>> fetchSearchHome(String query) async {
    Map<String, dynamic> data =
        await apiService.get(endPoint: "$kEndPointsSearch$query");

    List<MoviesModel> listSearchMovies = [];

    for (var moive in data[kResults]) {
      listSearchMovies.add(MoviesModel.fromJson(moive));
    }

    return listSearchMovies;
  }
}
