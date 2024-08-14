part of 'top_rated_movies_bloc.dart';

sealed class TopRatedMoviesEvent extends Equatable {
  const TopRatedMoviesEvent();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesGetEvent extends TopRatedMoviesEvent {
  final int page;

  const TopRatedMoviesGetEvent({this.page = 1});
  @override
  List<Object> get props => [page];
}
