import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final String idNumber;
  final String name;

  RegisterScreen({required this.idNumber, required this.name});

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController(
      text: idNumber,
    );
    final TextEditingController nameController = TextEditingController(
      text: name,
    );
    final TextEditingController dobController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController zipcodeController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 48,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'เลขบัตรประชาชน'),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'ชื่อ-นามสกุล'),
              ),
              TextField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: 'วันเดือนปีเกิด (เช่น 01/01/1990)',
                ),
                keyboardType: TextInputType.datetime,
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'ที่อยู่'),
                maxLines: 3,
              ),
              TextField(
                controller: zipcodeController,
                decoration: InputDecoration(labelText: 'รหัสไปรษณีย์'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              // ElevatedButton(
              //   onPressed: () {

              //     Navigator.pushReplacementNamed(context, '/login');
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.blue[700],
              //     minimumSize: Size(double.infinity, 48),
              //   ),
              //   child: Text(
              //     'ยืนยันสมัครสมาชิก',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/auth');
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.blue[700]),
                      label: Text(
                        'ย้อนกลับ',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                      label: Text(
                        'ยืนยัน',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
