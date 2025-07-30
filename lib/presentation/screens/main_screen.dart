import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';
import 'package:frontend/presentation/screens/profile/profile_screen.dart';
import 'package:frontend/presentation/screens/schedule/schedule_select_screen.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [HomeScreen(), ScheduleSelectScreen(), ProfileScreen()];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavbarWidget(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
