import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';
import 'package:frontend/presentation/widgets/schedule/schedule_success_box.dart';
import 'package:frontend/presentation/widgets/schedule/step_progress_indicator.dart';

class ScheduleConfirmationScreen extends StatelessWidget {
  const ScheduleConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 20),
            StepProgressIndicator(currentStep: 4),
            SizedBox(height: 60),
            ScheduleSuccessBox(),
          ],
        ),
      ),

    );
  }
}
