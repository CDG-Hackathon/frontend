import 'package:flutter/material.dart';

class DetailContact extends StatefulWidget {
  const DetailContact({super.key});

  @override
  State<DetailContact> createState() => _DetailContact();
}

class _DetailContact extends State<DetailContact> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 15.0),
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            // color: Color.fromARGB(15, 12, 105, 180),
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(
            //   color: Color.fromARGB(255, 12, 105, 180),
            //   width: 1,
            // ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ข้อมูลติดต่อ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 105, 180),
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: const [
                  Icon(Icons.phone, size: 20, color: Color.fromARGB(255, 12, 105, 180)),
                  SizedBox(width: 8),
                  Text(
                    '081-234-5678',
                    style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 12, 105, 180)),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: const [
                  Icon(Icons.email, size: 20, color: Color.fromARGB(255, 12, 105, 180)),
                  SizedBox(width: 8),
                  Text(
                    'user@example.com',
                    style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 12, 105, 180)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
