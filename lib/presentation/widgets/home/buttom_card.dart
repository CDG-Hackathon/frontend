import 'package:flutter/material.dart';

class ButtomCard extends StatelessWidget {
  const ButtomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  print('กดกล่อง ประวัติการรักษา');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    'ประวัติการรักษา',
                    style: TextStyle(color: Color.fromARGB(255, 12, 105, 180), fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  print('กดกล่อง สิทธิประกันสุขภาพ');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    'สิทธิประกันสุขภาพ',
                    style: TextStyle(color: Color.fromARGB(255, 12, 105, 180), fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
