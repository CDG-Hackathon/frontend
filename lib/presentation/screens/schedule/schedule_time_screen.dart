import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/auth/login_screen.dart';
import 'package:frontend/presentation/screens/auth/ocr_screen.dart';
import 'package:frontend/presentation/screens/auth/register_screen.dart';
import 'package:frontend/presentation/widgets/navbar/navbar_widget.dart';
import 'package:frontend/presentation/widgets/schedule/dot_loading_animation.dart';
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

    Map<String, int> bookingCount = {
      '08.00-09.00': 1,
      '09.00-10.00': 3,
      '10.00-11.00': 5, // เต็ม
      // ...
    };
    List<String> recommendedSlots = [
      '10.00-11.00',
      '14.00-15.00',
      '20.00-21.00',
    ];

    const int maxBookingPerSlot = 5;

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
                const StepProgressIndicator(currentStep: 3),
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

                const SizedBox(height: 20),

                const Text(
                  'ช่วงเวลาที่แนะนำ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 105, 180),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedSlots.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final slot = recommendedSlots[index];
                      final isSelected = selectedTime == slot;
                      return GestureDetector(
                        onTap: () => setState(() => selectedTime = slot),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue[700] : Colors.white,
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
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'เลือกช่วงเวลา',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 105, 180),
                  ),
                ),
                const SizedBox(height: 12),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.8,
                    physics:
                        const BouncingScrollPhysics(), 
                    children:
                        timeSlots.map((slot) {
                          final isSelected = selectedTime == slot;
                          final booked = bookingCount[slot] ?? 0;
                          final percent = booked / maxBookingPerSlot;

                          Color progressColor;
                          if (percent >= 0.8) {
                            progressColor = Colors.redAccent;
                          } else if (percent >= 0.4) {
                            progressColor = Colors.orangeAccent;
                          } else {
                            progressColor = Colors.greenAccent;
                          }

                          return GestureDetector(
                            onTap: () => setState(() => selectedTime = slot),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
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
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.3),
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    slot,
                                    style: TextStyle(
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  LinearProgressIndicator(
                                    value: percent,
                                    backgroundColor: Colors.grey[300],
                                    color: progressColor,
                                    minHeight: 6,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
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
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            barrierColor: Colors.transparent,
                            builder: (context) {
                              return Center(
                                child: DotLoadingAnimation(
                                  dotSize: 14,
                                  dotColor: Colors.blue,
                                ),
                              );
                            },
                          );

                          Future.delayed(
                            const Duration(seconds: 2, milliseconds: 0),
                            () {
                              Navigator.pop(context); 
                              Navigator.pushNamed(
                                context,
                                '/schedule-confirmation',
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.check, color: Colors.white),
                        label: const Text(
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
            height: 40,
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
