import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/reservation_widgets/section_image.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/reservation_widgets/section_listview_reservation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyReservationView extends StatelessWidget {
  const BodyReservationView({super.key, required this.moviesEntity});
  final MoviesEntity moviesEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: AppLinear.linearPages,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              SectionImageReversation(moviesEntity: moviesEntity),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 50.h, left: 12.w, right: 12.w),
            height: MediaQuery.of(context).size.height / 1.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: AppLinear.linearConrainer),
            child: SectionListViewReservation(moviesEntity: moviesEntity),
          ),
        ],
      ),
    );
  }
}
