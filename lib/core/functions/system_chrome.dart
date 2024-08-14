import 'package:cine_reserve_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void systemChrome() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color.fromARGB(255, 2, 69, 110),
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const CineReserveApp()));
}
