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
                      Navigator.pop(context);
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
  int selectedIndex = -1;

  final List<String> titles = ['นัดหมายเเพทย์', 'ตรวจสุขภาพ', 'ฉีดวัคซีน'];

  final TextEditingController _detailsController = TextEditingController();

  void _showDetailsDialog(String title) {
    _detailsController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          titlePadding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.all(16),
          title: Row(
            children: [
              const Icon(Icons.info_outline, color: Colors.blue),
              const SizedBox(width: 8),
              Expanded(child: Text('กรอกรายละเอียด - $title')),
            ],
          ),
          content: TextField(
            controller: _detailsController,
            decoration: InputDecoration(
              hintText: 'พิมพ์รายละเอียดอาการ...',
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            maxLines: 4,
          ),
          actionsPadding: const EdgeInsets.only(right: 16, bottom: 12),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('ยกเลิก'),
            ),
            FilledButton(
              onPressed: () {
                final symptom = _detailsController.text;
                Navigator.pop(context); 
                Future.delayed(const Duration(milliseconds: 300), () {
                  _showPredictionDialog(symptom); 
                });
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.blue[700],
                textStyle: const TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('บันทึก'),
            ),
          ],
        );
      },
    );
  }

  void _showPredictionDialog(String symptom) {
    String result;
    if (symptom.contains('ไข้')) {
      result = 'อาจเป็นไข้หวัด หรือ ไข้ไวรัส';
    } else if (symptom.contains('ปวดหัว')) {
      result = 'อาจเป็นไมเกรน หรือ ภาวะเครียดสะสม';
    } else if (symptom.contains('ไอ') || symptom.contains('เจ็บคอ')) {
      result = 'อาจเป็นหลอดลมอักเสบ หรือ หวัดธรรมดา';
    } else {
      result = 'ยังไม่สามารถวิเคราะห์ได้แน่ชัด ควรปรึกษาแพทย์';
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text('ผลการวิเคราะห์อาการ'),
            content: Text(result),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ปิด'),
              ),
            ],
          ),
    );
  }

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

            _showDetailsDialog(titles[index]);
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
