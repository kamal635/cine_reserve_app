import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/bottom_vav_bar/section_blurred_color.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/bottom_vav_bar/section_button.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/bottom_vav_bar/section_info_date_and_time.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/bottom_vav_bar/section_info_price.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/bottom_vav_bar/section_info_seats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSelectSeats extends StatelessWidget {
  const CustomBottomSelectSeats(
      {super.key,
      required this.day,
      required this.dayNumber,
      required this.hour,
      required this.seats,
      required this.numberSeats,
      required this.priceSeats});
  final String day;
  final String dayNumber;
  final String hour;
  final List seats;
  final int numberSeats;
  final int priceSeats;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SectionBluredColor(),
        Container(
          height: 200.h,
          padding: EdgeInsets.only(left: 8.w),
          decoration: BoxDecoration(
            color: AppColor.white.withOpacity(0.15),
            border: const Border(
              top: BorderSide(color: AppColor.white),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SectionInfoDateAndTime(
                      dayNumber: dayNumber,
                      hour: hour,
                      day: day,
                    ),
                    SectionInfoSeats(seats: seats),
                    SectionInfoPrice(
                      numberSeats: numberSeats,
                      priceSeats: priceSeats,
                    )
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: SectionButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
