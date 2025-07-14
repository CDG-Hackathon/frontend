import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class NavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavbarWidget({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color.fromARGB(255, 12, 105, 180),
      backgroundColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/home_grey.svg',
            width: 24,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            'assets/images/home_blue.svg',
            width: 24,
            height: 24,
          ),
          label: 'หน้าหลัก',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/sch_grey.svg',
            width: 24,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            'assets/images/sch_blue.svg',
            width: 24,
            height: 24,
          ),
          label: 'นัดหมาย',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/user_grey.svg',
            width: 24,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            'assets/images/user_blue.svg',
            width: 24,
            height: 24,
          ),
          label: 'ข้อมูลผู้ใช้',
        ),
      ],
    );
  }
}
