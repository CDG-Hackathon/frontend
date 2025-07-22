import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/presentation/screens/main_screen.dart';
import 'package:frontend/presentation/screens/schedule/schedule_confirmation.dart';

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
      initialRoute: '/test-confirmation', // for preview
      routes: {
        '/': (context) => Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/BGAnimation.png',
                    fit: BoxFit.cover,
                  ),
                ),
                MainScreen(), // ✅ FIXED: removed `const`
              ],
            ),
        '/test-confirmation': (context) => const ScheduleConfirmationScreen(), // ✅ NEW
      },
    );
  }
}
