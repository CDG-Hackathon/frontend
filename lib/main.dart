import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/presentation/screens/main_screen.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CuraQ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: '/profile',
      routes: {
        '/':
            (context) => Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/BGAnimation.png',
                    fit: BoxFit.cover,
                  ),
                ),
                MainScreen(),
              ],
            ),
        '/profile':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const ProfileScreen(),
                ],
              ),
            ),
      },
    );
  }
}
