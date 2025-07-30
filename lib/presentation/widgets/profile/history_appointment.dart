import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/components/appointment_component.dart';

class HistoryAppointment extends StatefulWidget {
  const HistoryAppointment({super.key});

  @override
  State<HistoryAppointment> createState() => _HistoryAppointment();
}

class _HistoryAppointment extends State<HistoryAppointment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 21.0,
        vertical: 0.0
      ), 
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(15, 12, 105, 180), 
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(
          //   color: Color.fromARGB(255, 12, 105, 180),
          //   width: 1,
          // ),
        ),
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text(
              'ประวัติการนัดหมาย',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 12, 105, 180),
              ),
            ),
            Text(
              'ทั้งหมด',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[200],
              ),
            ),
              ],
            ),
            const SizedBox(height: 12),

            AppointmentComponent(),
            AppointmentComponent()
          ],
        ),
      ),
    );
  }
}
