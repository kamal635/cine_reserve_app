import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/use_cases/up_coming_movies_use_case.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/check_internet/check_internet_bloc.dart';
import 'package:equatable/equatable.dart';

part 'up_coming_event.dart';
part 'up_coming_state.dart';

class UpComingBloc extends Bloc<UpComingEvent, UpComingState> {
  final UpComingMoviesUseCase upComingMoviesUseCase;
  StreamSubscription<CheckInternetState>? streamSubscription;
  final CheckInternetBloc checkInternetBloc;
  List<MoviesEntity> allMovies = [];
  UpComingBloc(
      {required this.upComingMoviesUseCase, required this.checkInternetBloc})
      : super(UpComingStateLoading()) {
    // stream to listen internet
    streamSubscription = checkInternetBloc.stream.listen((state) {
      if (state is OnlineState) {
        add(const UpComingMoviesEvent());
      }
    });
    on<UpComingMoviesEvent>(_onUpComingMoviesEvent);
  }

// event up coming movie
  Future<void> _onUpComingMoviesEvent(
    UpComingMoviesEvent event,
    Emitter<UpComingState> emit,
  ) async {
    final movies =
        await upComingMoviesUseCase.getUpComingMovies(page: event.page);
    movies.fold(
      (l) {
        {
          {
            if (event.page == 1) {
              return emit(UpComingStateFailure(errorMessage: l.message));
            } else {
              return emit(
                  UpComingStateFailurePagination(errorMessage: l.message));
            }
          }
        }
      },
      (r) {
        allMovies.addAll(r);
        return emit(UpComingStateSuccess(listMovies: List.from(allMovies)));
      },
    );
  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}
