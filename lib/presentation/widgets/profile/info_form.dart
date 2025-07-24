import 'package:flutter/material.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  // Helper method to create a styled text field container
  Widget _buildStyledTextField({
    String? initialValue,
    String? hintText,
    double? width,
    int maxLines = 1,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 71, 141, 212)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none, // Remove default TextField border
          isDense: true, // Make the input more compact
          contentPadding: EdgeInsets.zero, // Remove default padding
        ),
        style: const TextStyle(
          color: Color.fromARGB(255, 12, 105, 180), // Blue text
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        maxLines: maxLines,
      ),
    );
  }

  // Helper method to create a section container without the outer border,
  // making the text fields themselves have the visible borders.
  Widget _buildSectionContainer({
    required String title,
    required Widget content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 16.0,
      ), // Reduced vertical padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 12, 105, 180), // Blue title
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          content,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 430,
        child: Column(
          // Changed from SingleChildScrollView(child: Column)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionContainer(
              title: 'เลขบัตรประชาชน:',
              content: _buildStyledTextField(
                initialValue: '1-2345-67890-12-3',
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 5),
            _buildSectionContainer(
              title: 'ชื่อ-นามสกุล:',
              content: Row(
                children: [
                  Expanded(
                    child: _buildStyledTextField(
                      initialValue: 'นพรัตน์',
                      hintText: 'ชื่อ',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStyledTextField(
                      initialValue: 'แสนประเสริฐ',
                      hintText: 'นามสกุล',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            _buildSectionContainer(
              title: 'วัน เดือน ปีเกิด:',
              content: Row(
                children: [
                  SizedBox(
                    width: 60, // Fixed width for day
                    child: _buildStyledTextField(initialValue: '1'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStyledTextField(initialValue: 'มกราคม'),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 70, // Fixed width for year
                    child: _buildStyledTextField(initialValue: '2001'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            _buildSectionContainer(
              title: 'เพศ:', // Title moved here as per new image
              content: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: _buildStyledTextField(initialValue: 'ชาย'),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'กรุ๊ปเลือด:',
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 105, 180),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 50,
                    child: _buildStyledTextField(initialValue: 'A'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5), // Reduced spacing between sections
            // ประวัติการแพ้ยา (Drug Allergy History)
            _buildSectionContainer(
              title: 'ประวัติการแพ้ยา:',
              content: _buildStyledTextField(
                maxLines: 5, // Multi-line input
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 5), // Reduced spacing between sections
            // สิทธิหลักประกันสุขภาพ (Main Health Insurance Rights)
            _buildSectionContainer(
              title: 'สิทธิหลักประกันสุขภาพ:',
              content: _buildStyledTextField(
                maxLines: 5, // Multi-line input
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 10), // Reduced space at the bottom
          ],
        ),
      ),
    );
  }
}
