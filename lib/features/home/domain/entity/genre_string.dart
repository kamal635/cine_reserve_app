import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';

class GenreString {
  Map<int, String> genreMapping = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
  };

  List<String?> getGenreName(List<dynamic>? genreId) {
    List<String?> listGenre = [];
    for (int idNumber in genreId!) {
      listGenre.add(genreMapping[idNumber]);
    }
    return listGenre;
  }

  List<String?> genreStringMethod(GenreString genre, MoviesEntity movieEntity) {
    List<String?> genreString = genre.getGenreName(movieEntity.genreIdsMovie);

    for (int i = 0; i < genreString.length; i++) {
      genreString[i];
    }
    return genreString;
  }
}
