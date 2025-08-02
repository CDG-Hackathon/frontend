import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/schedule/appoint_form.dart';
import 'package:frontend/presentation/widgets/schedule/profile_header.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';
import 'package:frontend/presentation/widgets/schedule/step_progress_indicator.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: 20),
          // ProfileHeader(),
          const SizedBox(height: 20),

          const StepProgressIndicator(currentStep: 2),
          const SizedBox(height: 20),
          AppointmentForm(),

          const SizedBox(height: 55),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.blue[700]),
                  label: Text(
                    'ย้อนกลับ',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/schedule-time');
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
