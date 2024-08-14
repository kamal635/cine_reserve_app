import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/custom_blurred_circle.dart';
import 'package:cine_reserve_app/features/tickets/presentation/widgets/carousel_ticket.dart';
import 'package:cine_reserve_app/features/tickets/presentation/widgets/title_ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketsViewBody extends StatelessWidget {
  const TicketsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: kToolbarHeight + 75.h),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(gradient: AppLinear.linearPages),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                const BlurredCircle(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleTicketView(),
                    SizedBox(
                      height: 30.h,
                    ),
                    const CustomCarouselTickets(),
                    SizedBox(
                      height: 90.h,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
