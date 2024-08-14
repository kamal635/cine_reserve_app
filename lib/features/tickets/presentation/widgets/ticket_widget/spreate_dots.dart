import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpreateDots extends StatelessWidget {
  const SpreateDots({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
              constraints.constrainWidth() ~/ 12,
              (index) => SizedBox(
                    width: 6.w,
                    height: 2.h,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.black,
                      ),
                    ),
                  )),
        );
      },
    );
  }
}
