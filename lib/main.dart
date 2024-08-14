import 'package:cine_reserve_app/core/functions/init_app_flutter.dart';
import 'package:cine_reserve_app/core/functions/system_chrome.dart';
import 'package:cine_reserve_app/core/utils/dependency_injection.dart' as di;
import 'package:cine_reserve_app/core/utils/router.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/check_internet/check_internet_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/new_in_cinemas/new_in_cinemas_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/search_home/search_home_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/top_rated/top_rated_movies_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/up_coming/up_coming_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyImageCache extends ImageCache {
  @override
  void clear() {
    print('Clearing cache!');
    super.clear();
  }
}

class MyWidgetsBinding extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() => MyImageCache();
}

Future<void> main() async {
  await initFlutterApp();
  systemChrome();
}

class CineReserveApp extends StatelessWidget {
  const CineReserveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.42857142857144, 843.4285714285714),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                di.sl<NowInCinemasBloc>()..add(const NowInCinemasGetEvent()),
          ),
          BlocProvider(
            create: (context) => di.sl<CheckInternetBloc>(),
          ),
          BlocProvider(
            create: (context) =>
                di.sl<UpComingBloc>()..add(const UpComingMoviesEvent()),
          ),
          BlocProvider(
            create: (context) => di.sl<TopRatedMoviesBloc>()
              ..add(const TopRatedMoviesGetEvent()),
          ),
          BlocProvider(
            create: (context) => di.sl<SearchHomeBloc>(),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.goRoute,
        ),
      ),
    );
  }
}
