part of 'up_coming_bloc.dart';

sealed class UpComingEvent extends Equatable {
  const UpComingEvent();

  @override
  List<Object> get props => [];
}

class UpComingMoviesEvent extends UpComingEvent {
  final int page;

  const UpComingMoviesEvent({this.page = 1});
  @override
  List<Object> get props => [page];
}
