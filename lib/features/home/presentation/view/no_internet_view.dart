import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/app_assets_icons.dart';
import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppLinear.linearPages),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssetsIcons.offline,
              height: 120.h,
              width: 120.w,
              color: AppColor.black.withAlpha(200),
            ),
            ListTile(
              title: Text(
                kWhoops,
                textAlign: TextAlign.center,
                style: AppFonts.bold_20.copyWith(
                  color: AppColor.white.withAlpha(200),
                ),
              ),
              subtitle: Text(
                koffline,
                textAlign: TextAlign.center,
                style: AppFonts.regular_14.copyWith(
                  color: AppColor.white.withAlpha(185),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
