part of 'up_coming_bloc.dart';

sealed class UpComingState extends Equatable {
  const UpComingState();

  @override
  List<Object> get props => [];
}

final class UpComingStateLoading extends UpComingState {}

final class UpComingStateSuccess extends UpComingState {
  final List<MoviesEntity> listMovies;

  const UpComingStateSuccess({required this.listMovies});
  @override
  List<Object> get props => [listMovies];
}

final class UpComingStateFailure extends UpComingState {
  final String errorMessage;

  const UpComingStateFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class UpComingStateFailurePagination extends UpComingState {
  final String errorMessage;

  const UpComingStateFailurePagination({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
