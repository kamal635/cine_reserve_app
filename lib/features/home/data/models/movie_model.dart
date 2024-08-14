import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';

// ignore: must_be_immutable
class MoviesModel extends MoviesEntity {
  bool? adult;
  String? backdropPath;
  List<dynamic>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MoviesModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  }) : super(
            idMovie: id,
            adultMovie: adult,
            backdropPathMovie: backdropPath,
            genreIdsMovie: genreIds,
            originalLanguageMovie: originalLanguage,
            originalTitleMovie: originalTitle,
            overviewMovie: overview,
            popularityMovie: popularity,
            posterPathMovie: posterPath,
            releaseDateMovie: releaseDate,
            titleMovie: title,
            videoMovie: video,
            voteAverageMovie: voteAverage,
            voteCountMovie: voteCount);

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        adult: json['adult'] as bool?,
        backdropPath: json['backdrop_path'] as String?,
        genreIds: json['genre_ids'] as List<dynamic>?,
        id: json['id'] as int?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        posterPath: json['poster_path'] as String?,
        releaseDate: json['release_date'] as String?,
        title: json['title'] as String?,
        video: json['video'] as bool?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
  @override
  List<Object?> get props => [
        idMovie,
        adultMovie,
        backdropPathMovie,
        genreIdsMovie,
        originalLanguageMovie,
        originalTitleMovie,
        overviewMovie,
        popularityMovie,
        posterPathMovie,
        releaseDateMovie,
        titleMovie,
        videoMovie,
        voteAverageMovie,
        voteCountMovie
      ];
}
