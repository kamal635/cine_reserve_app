import 'package:cine_reserve_app/core/functions/build_router.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/new_in_cinemas/new_in_cinemas_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/view/home_view.dart';
import 'package:cine_reserve_app/features/home/presentation/view/search_home_view.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/shimmer_loading/body_shimmer_loading_home.dart';
import 'package:cine_reserve_app/features/reservation/presentation/view/reservation_view.dart';
import 'package:cine_reserve_app/features/reservation/presentation/view/select_seat_view.dart';
import 'package:cine_reserve_app/features/splash/presentation/view/splash_view.dart';
import 'package:cine_reserve_app/features/tickets/presentation/view/tickets_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String homeView = "/HomeView";
  static const String searchView = "/SearchView";
  static const String reservationView = "/ReservationView";
  static const String selectSeatsView = "/SelectSeatsView";
  static const String ticketsView = "/TicketsView";

  static GoRouter goRoute = GoRouter(routes: [
    buildRouter(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    buildRouter(
      path: homeView,
      builder: (context, state) =>
          BlocBuilder<NowInCinemasBloc, NowInCinemasState>(
        builder: (context, state) {
          if (state is NowInCinemasLoading) {
            return const ShimmerLoadingHome();
          } else {
            return const HomeView();
          }
        },
      ),
    ),
    buildRouter(
      path: searchView,
      builder: (context, state) => const SearchHomeView(),
    ),
    buildRouter(
      path: reservationView,
      builder: (context, state) =>
          ReservationView(moviesEntity: state.extra as MoviesEntity),
    ),
    buildRouter(
      path: selectSeatsView,
      builder: (context, state) => const SelectSeatsView(),
    ),
    buildRouter(
      path: ticketsView,
      builder: (context, state) => const TicketsView(),
    ),
  ]);
}
