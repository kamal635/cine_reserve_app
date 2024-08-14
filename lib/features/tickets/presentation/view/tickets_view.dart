import 'package:cine_reserve_app/features/tickets/presentation/widgets/body_ticket_view.dart';
import 'package:flutter/material.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: TicketsViewBody(),
    );
  }
}
