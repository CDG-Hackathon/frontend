import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/appoint/profile_header.dart';
import 'package:frontend/presentation/widgets/appoint/appoint_form.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ProfileHeader(),
          const SizedBox(height: 20),
          AppointmentForm(),
          const SizedBox(height: 120),
        ],
      ),
      bottomNavigationBar: NavbarWidget(
        currentIndex: 1,
        onTap: (index) {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
      ),
    );
  }
}
