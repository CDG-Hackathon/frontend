import 'package:flutter/material.dart';

class NameCard extends StatefulWidget {
  const NameCard({super.key});

  @override
  State<NameCard> createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'ข้อมูลผู้ใช้',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 12, 105, 180),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: 320,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(15, 12, 105, 180),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 25),

                    Icon(
                      Icons.account_circle,
                      size: 45,
                      color: Color.fromARGB(255, 12, 105, 180),
                    ),

                    const SizedBox(width: 25),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 15),
                        Text(
                          'นาย นพรัตน์ แสนประเสิรฐ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 105, 180),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Text(
                          '1-2345-67890-12-3',
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 105, 180),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 15),

                    Icon(
                      Icons.navigate_next,
                      size: 45,
                      color: Color.fromARGB(255, 12, 105, 180),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
