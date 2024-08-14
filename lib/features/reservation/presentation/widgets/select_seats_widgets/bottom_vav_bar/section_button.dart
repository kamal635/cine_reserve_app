import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SectionButton extends StatelessWidget {
  const SectionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 120.w,
      decoration: BoxDecoration(
          color: AppColor.secondry,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.r),
              bottomLeft: Radius.circular(60.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppLinear.withOpacity,
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.lightBlue.withOpacity(0.6),
                          offset: const Offset(-2, -2))
                    ]),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(60.r),
                onTap: () {
                  context.replace(AppRouter.homeView);
                },
                child: Container(
                  width: 90.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.coralRed.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    kConfirm,
                    style: AppFonts.bold_16.copyWith(color: AppColor.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
