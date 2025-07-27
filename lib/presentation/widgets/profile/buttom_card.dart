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
                  print('ยกเลิก');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color.fromARGB(255, 71, 141, 212),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 105, 180),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  print('ยืนยัน');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 71, 142, 212),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    'ยืนยัน',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
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
