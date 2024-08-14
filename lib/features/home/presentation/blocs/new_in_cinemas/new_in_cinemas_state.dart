part of 'new_in_cinemas_bloc.dart';

sealed class NowInCinemasState extends Equatable {
  const NowInCinemasState();

  @override
  List<Object> get props => [];
}

final class NowInCinemasLoading extends NowInCinemasState {}

final class NowInCinemasSuccess extends NowInCinemasState {
  final List<MoviesEntity> listMovie;

  const NowInCinemasSuccess({required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}

final class NowInCinemasFailure extends NowInCinemasState {
  final String errorMessage;

  const NowInCinemasFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class NowInCinemasFailurePagination extends NowInCinemasState {
  final String errorMessage;

  const NowInCinemasFailurePagination({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
