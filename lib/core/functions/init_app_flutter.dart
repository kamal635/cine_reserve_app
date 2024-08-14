import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/utils/bloc_observer.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/firebase_options.dart';
import 'package:cine_reserve_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cine_reserve_app/core/utils/dependency_injection.dart' as di;

Future<void> initFlutterApp() async {
  MyWidgetsBinding();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MoviesEntityAdapter());
  await Hive.openBox(kMovieBox);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.initGetIt();

  Bloc.observer = MyBlocObserver();
  await Future.delayed(const Duration(milliseconds: 500));
}
