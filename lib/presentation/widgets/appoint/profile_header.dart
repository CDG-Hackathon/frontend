import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text(
            'ยืนยันข้อมูล',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 12, 105, 180),
            ),
          ),
        ],
      ),
    );
  }
}
