import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/schedule/appoint_form.dart';
import 'package:frontend/presentation/widgets/schedule/profile_header.dart';
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
          // const SizedBox(height: 120),

          Padding(
            padding: const EdgeInsets.only(left: 0,top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/schedule-select');
                  },
                  // icon: Icon(Icons.arrow_forward, color: Colors.white),
                  label: Text(
                    'เลือกโรงพยาบาลนี้',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
