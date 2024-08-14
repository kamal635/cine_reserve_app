import 'package:bloc/bloc.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/domain/use_cases/search_home_use_case.dart';
import 'package:equatable/equatable.dart';

part 'search_home_event.dart';
part 'search_home_state.dart';

class SearchHomeBloc extends Bloc<SearchHomeEvent, SearchHomeState> {
  final SearchHomeUseCase searchHomeUseCase;

  SearchHomeBloc({required this.searchHomeUseCase})
      : super(const SearchHomeSuccess()) {
    on<SearchMoviesTappedEvent>(_onSearchMoviesTappedEvent);
  }

// event search home //
  Future<void> _onSearchMoviesTappedEvent(
    SearchMoviesTappedEvent event,
    Emitter<SearchHomeState> emit,
  ) async {
    final results = await searchHomeUseCase.getSearchHome(event.query);

    results.fold((l) => emit(SearchHomeFailure(errorMessage: l.message)), (r) {
      if (event.query.isNotEmpty) {
        emit(SearchHomeSuccess(listMovies: r));
      } else {
        emit(const SearchHomeSuccess(listMovies: []));
      }
    });
  }
}
