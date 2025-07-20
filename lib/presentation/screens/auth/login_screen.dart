import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/auth/login_form.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: const Text('Home Screen'),
      // ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            LoginForm(),

          ],
        ),
      ),
    );
  }
}