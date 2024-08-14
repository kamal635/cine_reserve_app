import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/custom_title_and_circle.dart';
import 'package:flutter/material.dart';

class CustomHintReservedOrNot extends StatelessWidget {
  const CustomHintReservedOrNot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTitleAndCircle(
          backgroundColor: AppColor.white,
          title: kAvailable,
        ),
        CustomTitleAndCircle(
          backgroundColor: AppColor.coralRed,
          title: kReserved,
        ),
        CustomTitleAndCircle(
          backgroundColor: AppColor.selectSeat,
          title: kSelected,
        ),
      ],
    );
  }
}
