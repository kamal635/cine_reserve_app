import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtonSearch extends StatelessWidget {
  const IconButtonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Transform.rotate(
        angle: 45 * 0.013,
        child: Icon(
          AppIcon.arrowLeftUp,
          color: AppColor.white.withAlpha(200),
          size: 26.r,
        ),
      ),
    );
  }
}
