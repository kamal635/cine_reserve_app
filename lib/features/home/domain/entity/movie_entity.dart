import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MoviesEntity extends Equatable {
  @HiveField(0)
  final int? idMovie;
  @HiveField(1)
  final bool? adultMovie;
  @HiveField(2)
  final String? backdropPathMovie;
  @HiveField(3)
  final List<dynamic>? genreIdsMovie;
  @HiveField(4)
  final String? originalLanguageMovie;
  @HiveField(5)
  final String? originalTitleMovie;
  @HiveField(6)
  final String? overviewMovie;
  @HiveField(7)
  final double? popularityMovie;
  @HiveField(8)
  final String? posterPathMovie;
  @HiveField(9)
  final String? releaseDateMovie;
  @HiveField(10)
  final String? titleMovie;
  @HiveField(11)
  final bool? videoMovie;
  @HiveField(12)
  final double? voteAverageMovie;
  @HiveField(13)
  final int? voteCountMovie;

  const MoviesEntity(
      {required this.idMovie,
      required this.adultMovie,
      required this.backdropPathMovie,
      required this.genreIdsMovie,
      required this.originalLanguageMovie,
      required this.originalTitleMovie,
      required this.overviewMovie,
      required this.popularityMovie,
      required this.posterPathMovie,
      required this.releaseDateMovie,
      required this.titleMovie,
      required this.videoMovie,
      required this.voteAverageMovie,
      required this.voteCountMovie});

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
