import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoTicket extends StatelessWidget {
  const InfoTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Thu, June 15", style: AppFonts.semiBold_12),
            SizedBox(
              width: 10.w,
            ),
            Text("Time: 6:00 pm", style: AppFonts.semiBold_12),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Row : B", style: AppFonts.semiBold_12),
            SizedBox(
              width: 10.w,
            ),
            Text("Seats : 8,9,10,11  ", style: AppFonts.semiBold_12),
          ],
        ),
      ],
    );
  }
}
