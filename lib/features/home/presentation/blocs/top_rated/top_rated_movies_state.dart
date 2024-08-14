part of 'top_rated_movies_bloc.dart';

sealed class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

final class TopRatedMoviesStateLoading extends TopRatedMoviesState {}

final class TopRatedMoviesStateSuccess extends TopRatedMoviesState {
  final List<MoviesEntity> listMovie;

  const TopRatedMoviesStateSuccess({required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}

final class TopRatedMoviesStateFailure extends TopRatedMoviesState {
  final String errorMessage;

  const TopRatedMoviesStateFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class TopRatedMoviesStateFailurePagination extends TopRatedMoviesState {
  final String errorMessage;

  const TopRatedMoviesStateFailurePagination({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
