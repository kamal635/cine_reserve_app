import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/features/home/data/data_source/local_data_source/movie_local.dart';
import 'package:cine_reserve_app/features/tickets/presentation/widgets/ticket_widget/custom_ticket.dart';
import 'package:flutter/material.dart';

class CustomCarouselTickets extends StatelessWidget {
  const CustomCarouselTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: MovieLocalDataSourceImpl.getMovie()
          .map((e) => CustomTicket(image: "$kBaseImage${e.posterPathMovie}"))
          .toList(),
      options: CarouselOptions(
        enableInfiniteScroll: false,
        aspectRatio: 3.5 / 4,
        enlargeCenterPage: true,
      ),
    );
  }
}
