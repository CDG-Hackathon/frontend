import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'ยืนยันข้อมูล',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 12, 105, 180),
          ),
        ),
        SizedBox(height: 10),
        Icon(
          Icons.account_circle,
          size: 100,
          color: Color.fromARGB(255, 12, 105, 180),
        ),
      ],
    );
  }
}
