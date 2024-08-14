import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/widgets/custom_appbar.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/reservation_widgets/body_reservation_view.dart';
import 'package:flutter/material.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key, required this.moviesEntity});
  final MoviesEntity moviesEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        backgroundTtile: AppColor.secondry.withOpacity(0.8),
        title: kTitleAppBarReservation,
        isBottom: false,
        isLeading: true,
      ),
      body: BodyReservationView(moviesEntity: moviesEntity),
    );
  }
}
