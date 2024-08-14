import 'package:cine_reserve_app/core/constant/app_assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        AppAssets.clapperBoard,
        fit: BoxFit.cover,
      ),
    );
  }
}
