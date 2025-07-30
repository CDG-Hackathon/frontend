import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/auth/auth_screen.dart';
import 'package:frontend/presentation/screens/auth/face_recognition_screen.dart';
import 'package:frontend/presentation/screens/auth/login_screen.dart';
import 'package:frontend/presentation/screens/auth/ocr_screen.dart';
import 'package:frontend/presentation/screens/auth/register_screen.dart';
import 'package:frontend/presentation/screens/home/home_screen.dart';
import 'package:frontend/presentation/screens/main_screen.dart';
import 'package:frontend/presentation/screens/profile/profile_screen.dart';
import 'package:frontend/presentation/screens/schedule/schedule_confirmation.dart';
import 'package:frontend/presentation/screens/schedule/schedule_select_screen.dart';
import 'package:frontend/presentation/screens/schedule/schedule_time_screen.dart';

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
      initialRoute: '/auth',
      routes: {
        '/':
            (context) => Scaffold(
              body: Stack(
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
            ),
        '/login':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const LoginScreen(),
                ],
              ),
            ),
        '/auth':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const AuthScreen(),
                ],
              ),
            ),
        '/ocr':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  OcrScreen(),
                ],
              ),
            ),
        '/face':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  FaceRecognitionScreen(),
                ],
              ),
            ),
        '/register':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  RegisterScreen(idNumber: '', name: ''),
                ],
              ),
            ),
        '/schedule-select':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ScheduleSelectScreen(),
                ],
              ),
            ),
        '/schedule-time':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ScheduleTimeScreen(),
                ],
              ),
            ),
        '/schedule-confirmation':
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/BGAnimation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ScheduleConfirmationScreen(),
                ],
              ),
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
                  ProfileScreen(),
                ],
              ),
            ),
      },
    );
  }
}
