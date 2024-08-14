import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';

class TitleTicketView extends StatelessWidget {
  const TitleTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Thank you for Choosing Us!",
        textAlign: TextAlign.center,
        style: AppFonts.regular_16.copyWith(color: AppColor.white),
      ),
      subtitle: Text(
        "Enjoy Your Movie Time",
        textAlign: TextAlign.center,
        style: AppFonts.bold_20.copyWith(color: AppColor.white),
      ),
    );
  }
}
