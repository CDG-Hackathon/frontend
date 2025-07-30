import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/auth/login_screen.dart';
import 'package:frontend/presentation/screens/auth/ocr_screen.dart';
import 'package:frontend/presentation/screens/auth/register_screen.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';
import 'package:frontend/presentation/widgets/schedule/step_progress_indicator.dart';

class ScheduleSelectScreen extends StatelessWidget {
  const ScheduleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const StepProgressIndicator(currentStep: 1),
            const SizedBox(height: 20),
            const SelectableBoxList(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 0),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/schedule-time');
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    label: Text(
                      'ถัดไป',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectableBoxList extends StatefulWidget {
  const SelectableBoxList({super.key});

  @override
  State<SelectableBoxList> createState() => _SelectableBoxListState();
}

class _SelectableBoxListState extends State<SelectableBoxList> {
  int selectedIndex = 0;

  final List<String> titles = ['นัดหมายเเพทย์', 'ตรวจสุขภาพ', 'ฉีดวัคซีน'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(titles.length, (index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 24),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.blue : Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    titles[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        );
      }),
    );
  }
}
