import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController idCardController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    final idCard = idCardController.text.trim();
    final password = passwordController.text;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    if (idCard == "1234567890123" && password == "password123") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("เข้าสู่ระบบสำเร็จ")));
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacementNamed(context, '/');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("เลขบัตรหรือรหัสผ่านไม่ถูกต้อง")),
      );
    }
  }

  String? validateIDCard(String? value) {
    if (value == null || value.length != 13) {
      return 'กรุณากรอกเลขบัตรประชาชน 13 หลัก';
    }
    if (!RegExp(r'^\d{13}$').hasMatch(value)) {
      return 'ต้องเป็นตัวเลขเท่านั้น';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: idCardController,
              keyboardType: TextInputType.number,
              maxLength: 13,
              decoration: const InputDecoration(
                labelText: 'เลขบัตรประชาชน',
                border: OutlineInputBorder(),
              ),
              validator: validateIDCard,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'รหัสผ่าน',
                border: OutlineInputBorder(),
              ),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'กรุณากรอกรหัสผ่าน'
                          : null,
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 12, 105, 180),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:
                    isLoading
                        ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                        : const Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
              ),
            ),

            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot-password');
                },
                child: const Text(
                  'ลืมรหัสผ่าน',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
