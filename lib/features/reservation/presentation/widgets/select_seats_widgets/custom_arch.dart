import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/paint_arch.dart';
import 'package:flutter/material.dart';

class CustomArch extends StatelessWidget {
  const CustomArch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          child: CustomPaint(
            painter: MyPainterBlur(),
          ),
        ),
        Align(
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
      ],
    );
  }
}
