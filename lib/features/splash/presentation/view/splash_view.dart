import 'dart:async';
import 'package:cine_reserve_app/core/utils/router.dart';
import 'package:cine_reserve_app/features/splash/presentation/widgets/body_splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3300), () {
      context.replace(AppRouter.homeView);
    });
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
