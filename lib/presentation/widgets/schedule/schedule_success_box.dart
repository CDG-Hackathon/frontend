import 'package:flutter/material.dart';

class ScheduleSuccessBox extends StatelessWidget {
  const ScheduleSuccessBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.check_circle,
          size: 120,
          color: Color.fromARGB(255, 86, 220, 168),
        ),
        const SizedBox(height: 20),
        const Text(
          'ระบบได้ยืนยันการนัดหมาย\nของท่านเรียบร้อยแล้ว',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 12, 105, 180),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 200,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              // Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacementNamed(context, '/');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.blue.shade200),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'กลับสู่หน้าหลัก',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
