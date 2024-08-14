part of 'new_in_cinemas_bloc.dart';

sealed class NowInCinemasEvent extends Equatable {
  const NowInCinemasEvent();

  @override
  List<Object> get props => [];
}

class NowInCinemasGetEvent extends NowInCinemasEvent {
  final int page;

  const NowInCinemasGetEvent({this.page = 1});
  @override
  List<Object> get props => [page];
}
