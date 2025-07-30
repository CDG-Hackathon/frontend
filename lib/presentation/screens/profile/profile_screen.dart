import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';
import 'package:frontend/presentation/widgets/profile/detail_contact.dart';
import 'package:frontend/presentation/widgets/profile/history_appointment.dart';
import 'package:frontend/presentation/widgets/profile/name_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          NameCard(),
          DetailContact(),
          HistoryAppointment(),
        ],
      ),
    );
  }
}
