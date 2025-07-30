import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;

  const StepProgressIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          'นัดหมาย',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 12, 105, 180),
          ),
        ),
        const SizedBox(height: 20),

        // Row: Step Circles + Lines (center-aligned)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _circle('1', currentStep == 1),
            _line(),
            _circle('2', currentStep == 2),
            _line(),
            _circle('3', currentStep == 3),
          ],
        ),
        const SizedBox(height: 6),

        // Row: Labels (aligned under each step)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            _stepLabel('เริ่มต้น',  currentStep == 1),
            SizedBox(width: 50),
            _stepLabel('ช่วงเวลา', currentStep == 2),
            SizedBox(width: 50),
            _stepLabel('สิ้นสุด', currentStep == 3),
          ],
        ),
      ],
    );
  }

  Widget _circle(String number, bool isActive) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _line() {
    return Container(
      width: 30,
      height: 2,
      color: Colors.grey.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}

class _stepLabel extends StatelessWidget {
  final String label;
  final bool isActive;

  const _stepLabel(this.label, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 12,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        color: isActive ? const Color.fromARGB(255, 12, 105, 180) : Colors.grey,
      ),
    );
  }
}
