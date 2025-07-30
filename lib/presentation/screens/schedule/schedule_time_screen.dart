import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/auth/login_screen.dart';
import 'package:frontend/presentation/screens/auth/ocr_screen.dart';
import 'package:frontend/presentation/screens/auth/register_screen.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';
import 'package:frontend/presentation/widgets/schedule/step_progress_indicator.dart';

class ScheduleTimeScreen extends StatelessWidget {
  const ScheduleTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> days = List.generate(31, (index) => '${index + 1}');
    List<String> months = List.generate(12, (index) => '${index + 1}');
    List<String> years = List.generate(5, (index) => '${now.year + index}');

    List<String> timeSlots = [
      '08.00-09.00',
      '09.00-10.00',
      '10.00-11.00',
      '11.00-12.00',
      // '12.00-13.00',
      '13.00-14.00',
      '14.00-15.00',
      '15.00-16.00',
      '16.00-17.00',
      '17.00-18.00',
      '18.00-19.00',
      '19.00-20.00',
      '20.00-21.00',
      '21.00-22.00',
      '22.00-23.00',
      '23.00-24.00',
    ];

    String selectedDay = now.day.toString();
    String selectedMonth = now.month.toString();
    String selectedYear = now.year.toString();
    String selectedTime = '';

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepProgressIndicator(currentStep: 2),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDropdownBox(
                      label: 'วัน',
                      items: days,
                      value: selectedDay,
                      onChanged: (val) => setState(() => selectedDay = val!),
                    ),
                    const SizedBox(width: 12),
                    _buildDropdownBox(
                      label: 'เดือน',
                      items: months,
                      value: selectedMonth,
                      onChanged: (val) => setState(() => selectedMonth = val!),
                    ),
                    const SizedBox(width: 12),
                    _buildDropdownBox(
                      label: 'ปี',
                      items: years,
                      value: selectedYear,
                      onChanged: (val) => setState(() => selectedYear = val!),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const Text(
                  'เลือกช่วงเวลา',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 105, 180),
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  height: 250,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.5,
                    physics: const NeverScrollableScrollPhysics(),
                    children:
                        timeSlots.map((slot) {
                          final isSelected = selectedTime == slot;
                          return GestureDetector(
                            onTap: () => setState(() => selectedTime = slot),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? Colors.blue[700]
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? Colors.blue[700]!
                                          : Colors.blue[100]!,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                slot,
                                style: TextStyle(
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 0,
                  ),
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
                          Navigator.pushNamed(
                            context,
                            '/schedule-confirmation',
                          );
                        },
                        // icon: Icon(Icons.arrow_forward, color: Colors.white),
                        label: Text(
                          'ยืนยันการนัดหมาย',
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildDropdownBox({
    required String label,
    required List<String> items,
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[100]!),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: const SizedBox(),
              icon: const Icon(Icons.keyboard_arrow_down),
              dropdownColor: Colors.white,
              items:
                  items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
