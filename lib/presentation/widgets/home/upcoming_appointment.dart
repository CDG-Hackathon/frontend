import 'package:flutter/material.dart';

class UpcomingAppointment extends StatefulWidget {
  const UpcomingAppointment({super.key});

  @override
  State<UpcomingAppointment> createState() => _UpcomingAppointment();
}

class _UpcomingAppointment extends State<UpcomingAppointment> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'การนัดหมายที่กำลังจะมาถึง:',
                style: TextStyle(
                  color: Color.fromARGB(255, 12, 105, 180),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: 360,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 210, 226, 255),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(85, 72, 125, 212),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'วันอังคารที่',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 12, 105, 180),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    '14',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 12, 105, 180),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'กุมภาพันธ์ 2567',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 12, 105, 180),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: 360,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 210, 226, 255),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(85, 72, 125, 212),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'วันอังคารที่',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 12, 105, 180),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    '14',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 12, 105, 180),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'กุมภาพันธ์ 2567',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 12, 105, 180),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
