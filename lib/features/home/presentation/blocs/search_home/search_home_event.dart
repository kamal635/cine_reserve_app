part of 'search_home_bloc.dart';

sealed class SearchHomeEvent extends Equatable {
  const SearchHomeEvent();

  @override
  List<Object> get props => [];
}

class SearchMoviesTappedEvent extends SearchHomeEvent {
  final String query;
  const SearchMoviesTappedEvent({required this.query});

  @override
  List<Object> get props => [query];
}
