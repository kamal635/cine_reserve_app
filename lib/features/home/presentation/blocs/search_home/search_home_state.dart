part of 'search_home_bloc.dart';

sealed class SearchHomeState extends Equatable {
  const SearchHomeState();

  @override
  List<Object> get props => [];
}

final class SearchHomeLoading extends SearchHomeState {}

final class SearchHomeSuccess extends SearchHomeState {
  final List<MoviesEntity> listMovies;

  const SearchHomeSuccess({this.listMovies = const []});
  @override
  List<Object> get props => [listMovies];
}

final class SearchHomeFailure extends SearchHomeState {
  final String errorMessage;

  const SearchHomeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
