import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/use_cases/to_rated_movies_use_case.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/check_internet/check_internet_bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final TopRatedMoviesUseCase topRatedMoviesUseCase;
  StreamSubscription<CheckInternetState>? streamSubscription;
  final CheckInternetBloc checkInternetBloc;
  List<MoviesEntity> allMovies = [];
  TopRatedMoviesBloc(
      {required this.checkInternetBloc, required this.topRatedMoviesUseCase})
      : super(TopRatedMoviesStateLoading()) {
    // stream to listen internet
    streamSubscription = checkInternetBloc.stream.listen((state) {
      if (state is OnlineState) {
        add(const TopRatedMoviesGetEvent());
      }
    });
    on<TopRatedMoviesGetEvent>(_onTopRatedMoviesGetEvent);
  }
// event top rated movies
  Future<void> _onTopRatedMoviesGetEvent(
    TopRatedMoviesGetEvent event,
    Emitter<TopRatedMoviesState> emit,
  ) async {
    final movies =
        await topRatedMoviesUseCase.getTopRatedMovies(page: event.page);

    movies.fold((l) {
      {
        if (event.page == 1) {
          return emit(TopRatedMoviesStateFailure(errorMessage: l.message));
        } else {
          return emit(
              TopRatedMoviesStateFailurePagination(errorMessage: l.message));
        }
      }
    }, (r) {
      allMovies.addAll(r);
      return emit(TopRatedMoviesStateSuccess(listMovie: List.from(allMovies)));
    });
  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}
