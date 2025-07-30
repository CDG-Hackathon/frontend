import 'package:flutter/material.dart';

class AppointmentForm extends StatelessWidget {
  const AppointmentForm({super.key});

  Widget _buildStyledContainer({
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 4,
    ),
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 71, 141, 212)),
      ),
      child: child,
    );
  }

  // Helper method to create a section with a title
  Widget _buildSection({required String title, required Widget content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 12, 105, 180),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: content,
        ),
      ],
    );
  }

  // Helper method to create a button for a hospital
  Widget _buildHospitalButton({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 71, 141, 212)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 12, 105, 180),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 230, 240, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 430,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildSection(
                title: 'เลือกสิทธิการรักษา',
                content: _buildStyledContainer(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: 'สิทธิบัตรทอง',
                      items: const [
                        DropdownMenuItem(
                          value: 'สิทธิบัตรทอง',
                          child: Text(
                            'สิทธิบัตรทอง',
                            style: TextStyle(
                              color: Color.fromARGB(255, 12, 105, 180),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'สิทธิข้าราชการ',
                          child: Text(
                            'สิทธิข้าราชการ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 12, 105, 180),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (String? newValue) {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 12, 105, 180),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSection(
                title: 'เลือกโรงพยาบาล',
                content: _buildStyledContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'ค้นหาโรงพยาบาล',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 12, 105, 180),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 12, 105, 180),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildHospitalButton(label: 'โรงพยาบาลบำรุงราษฎร์ กทม.'),
              const SizedBox(height: 10),
              _buildHospitalButton(
                label: 'โรงพยาบาลศิริราช ปิยมหาราชการุณย์ กทม.',
              ),
              const SizedBox(height: 10),
              _buildHospitalButton(label: 'โรงพยาบาลรามาธิบดี กทม.'),
              const SizedBox(height: 10),
              _buildHospitalButton(
                label: 'โรงพยาบาลจุฬาลงกรณ์ สภากาชาดไทย กทม.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
