import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/profile/buttom_card.dart';
import 'package:frontend/presentation/widgets/profile/info_form.dart';
import 'package:frontend/presentation/widgets/profile/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        // Changed from Center(child: Column)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          ProfileHeader(),
          Expanded(child: PersonalInfoForm()),
          ButtomCard(),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
