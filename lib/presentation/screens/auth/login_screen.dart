import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/auth/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue[100],
                  child: Icon(Icons.person, size: 60, color: Colors.blue[700]),
                ),
                const SizedBox(height: 24),
                LoginForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
