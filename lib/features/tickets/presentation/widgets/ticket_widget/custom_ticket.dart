import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/features/tickets/presentation/widgets/ticket_clipper.dart';
import 'package:cine_reserve_app/features/tickets/presentation/widgets/ticket_widget/barcode_ticket.dart';
import 'package:cine_reserve_app/features/tickets/presentation/widgets/ticket_widget/image_ticket.dart';
import 'package:cine_reserve_app/features/tickets/presentation/widgets/ticket_widget/info_ticket.dart';
import 'package:cine_reserve_app/features/tickets/presentation/widgets/ticket_widget/spreate_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTicket extends StatelessWidget {
  const CustomTicket({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(holeRadius: 80.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40.r),
          ),
          color: AppColor.white.withOpacity(0.9),
        ),
        width: 260.w,
        height: 460.h,
        child: Column(
          children: [
            ImageTicket(image: image),
            SizedBox(
              height: 0.5.h,
            ),
            const SpreateDots(),
            SizedBox(
              height: 10.h,
            ),
            const InfoTicket(),
            const Expanded(child: BarCodeTicket()),
          ],
        ),
      ),
    );
  }
}
