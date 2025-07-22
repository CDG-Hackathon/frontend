import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';
import 'package:frontend/presentation/widgets/schedule/schedule_success_box.dart';
import 'package:frontend/presentation/widgets/schedule/step_progress_indicator.dart';

class ScheduleConfirmationScreen extends StatelessWidget {
  const ScheduleConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 250, 255),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 60),
            StepProgressIndicator(),
            SizedBox(height: 60),
            ScheduleSuccessBox(),
          ],
        ),
      ),
      bottomNavigationBar: NavbarWidget(
        currentIndex: 1, // นัดหมาย tab
        onTap: (index) {
          // You can route here based on index
          Navigator.popUntil(context, (route) => route.isFirst);
        },
      ),
    );
  }
}
