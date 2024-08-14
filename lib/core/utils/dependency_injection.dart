import 'package:cine_reserve_app/core/utils/api_service.dart';
import 'package:cine_reserve_app/features/home/data/data_source/remote_data_source/new_in_cinema_remote_data_source.dart';
import 'package:cine_reserve_app/features/home/data/data_source/remote_data_source/search_home_remote.dart';
import 'package:cine_reserve_app/features/home/data/data_source/remote_data_source/top_rated_movies_remote.dart';
import 'package:cine_reserve_app/features/home/data/data_source/remote_data_source/up_coming_movies_remote.dart';
import 'package:cine_reserve_app/features/home/data/repository_implements/new_in_cinemas_repo_impl.dart';
import 'package:cine_reserve_app/features/home/data/repository_implements/search_home_repo_impl.dart';
import 'package:cine_reserve_app/features/home/data/repository_implements/top_rated_repo_impl.dart';
import 'package:cine_reserve_app/features/home/data/repository_implements/up_coming_repo_impl.dart';
import 'package:cine_reserve_app/features/home/domain/repository/new_in_cinemas_repo.dart';
import 'package:cine_reserve_app/features/home/domain/repository/search_home_repo.dart';
import 'package:cine_reserve_app/features/home/domain/repository/top_rated_repo.dart';
import 'package:cine_reserve_app/features/home/domain/repository/up_coming_repo.dart';
import 'package:cine_reserve_app/features/home/domain/use_cases/now_in_cinemas_use_case.dart';
import 'package:cine_reserve_app/features/home/domain/use_cases/search_home_use_case.dart';
import 'package:cine_reserve_app/features/home/domain/use_cases/to_rated_movies_use_case.dart';
import 'package:cine_reserve_app/features/home/domain/use_cases/up_coming_movies_use_case.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/check_internet/check_internet_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/new_in_cinemas/new_in_cinemas_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/search_home/search_home_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/top_rated/top_rated_movies_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/up_coming/up_coming_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initGetIt() async {
  //! Bloc

  sl.registerFactory(() => NowInCinemasBloc(
      checkInternetBloc: sl.call(), newInCinemasUseCase: sl.call()));
  sl.registerFactory(() => CheckInternetBloc());
  sl.registerFactory(() => UpComingBloc(
      checkInternetBloc: sl.call(), upComingMoviesUseCase: sl.call()));
  sl.registerFactory(() => TopRatedMoviesBloc(
      checkInternetBloc: sl.call(), topRatedMoviesUseCase: sl.call()));
  sl.registerFactory(() => SearchHomeBloc(searchHomeUseCase: sl.call()));

  //! Data Sources
  sl.registerLazySingleton(() => NowInCinemasRemoteImpl(apiService: sl.call()));
  sl.registerLazySingleton(
      () => UpComingMoviesRemoteImple(apiService: sl.call()));
  sl.registerLazySingleton(
      () => TopRatedMoviesRemoteImple(apiService: sl.call()));
  sl.registerLazySingleton(() => SearchHomeRemoteImpl(apiService: sl.call()));

  //! Repository
  sl.registerLazySingleton<NowInCinemasRepo>(
      () => NowInCinemasRepoImpl(newInCinemasRemoteImpl: sl.call()));
  sl.registerLazySingleton<UpComingMoviesReop>(
      () => UpComingMoviesRepoImpl(upComingMoviesRemoteImple: sl.call()));
  sl.registerLazySingleton<TopRatedMoviesRepo>(
      () => TopRatedMoviesRepoImpl(topRatedMoviesRemoteImple: sl.call()));
  sl.registerLazySingleton<SearchHomeRepo>(
      () => SearchHomeRepoImpl(searchHomeRemoteImpl: sl.call()));

  //! Use Cases
  sl.registerLazySingleton(
      () => NowInCinemasUseCase(nowInCinemasRepo: sl.call()));
  sl.registerLazySingleton(
      () => UpComingMoviesUseCase(upComingMoviesReop: sl.call()));
  sl.registerLazySingleton(
      () => TopRatedMoviesUseCase(topRatedMoviesRepo: sl.call()));
  sl.registerLazySingleton(() => SearchHomeUseCase(searchHomeRepo: sl.call()));

  //! Core
  sl.registerLazySingleton<ApiService>(() => ApiService(sl.call()));

  //!External

  sl.registerLazySingleton<Dio>(() => Dio());
}
