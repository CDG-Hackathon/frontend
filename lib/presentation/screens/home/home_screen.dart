import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/home/buttom_card.dart';
import 'package:frontend/presentation/widgets/home/health_button.dart';
import 'package:frontend/presentation/widgets/home/profile_header.dart';
import 'package:frontend/presentation/widgets/home/upcoming_appointment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileHeader(),
            ButtomCard(),
            UpcomingAppointment(),
            HealthButton(),


          ],
        ),
      ),
    );
  }
}
