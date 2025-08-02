import 'package:another_flushbar/flushbar.dart';
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ElevatedButton.icon(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   icon: Icon(Icons.arrow_back, color: Colors.blue[700]),
                  //   label: Text(
                  //     'ย้อนกลับ',
                  //     style: TextStyle(
                  //       color: Colors.blue[700],
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(5.0),
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/schedule-time');
                      Navigator.pushNamed(context, '/schedule-hospital');
                    },
                    // icon: Icon(Icons.arrow_forward, color: Colors.white),
                    label: Text(
                      'ดำเนินการ',
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

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _onsetDateController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _allergyController = TextEditingController();
  final TextEditingController _chronicController = TextEditingController();
  bool _hasContactOrTravel = false;
  String _selectedGender = 'ชาย';

  void _showSymptomInputDialog(String title) {
    showDialog(
      context: context,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final dialogWidth = screenWidth > 700 ? 700.0 : screenWidth * 1.6;

        return Center(
          child: SizedBox(
            width: dialogWidth,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              titlePadding: const EdgeInsets.all(16),
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
              title: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'กรอกข้อมูลผู้ป่วย - $title',
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildInput(
                      _detailsController,
                      'พิมพ์รายละเอียดอาการ...',
                      maxLines: 3,
                    ),
                    _buildInput(_ageController, 'อายุ', isNumber: true),
                    _buildDropdownGender(),
                    _buildInput(
                      _weightController,
                      'น้ำหนัก (กก.)',
                      isNumber: true,
                    ),
                    _buildInput(
                      _heightController,
                      'ส่วนสูง (ซม.)',
                      isNumber: true,
                    ),
                    _buildDatePicker(context),
                    _buildInput(
                      _temperatureController,
                      'อุณหภูมิ (°C)',
                      isNumber: true,
                    ),
                    _buildInput(
                      _allergyController,
                      'ประวัติแพ้ยา (ถ้าไม่มีให้เว้นว่าง)',
                    ),
                    _buildInput(_chronicController, 'โรคประจำตัว เช่น เบาหวาน'),
                    const SizedBox(height: 8),
                  ],
                ),
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
                  child: const Text(
                    'ยกเลิก',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    final Map<String, dynamic> patientData = {
                      'symptom': _detailsController.text,
                      'age': _ageController.text,
                      'gender': _selectedGender,
                      'weight': _weightController.text,
                      'height': _heightController.text,
                      'bmi': _calculateBMI(
                        _weightController.text,
                        _heightController.text,
                      ),
                      'onset_date': _onsetDateController.text,
                      'temperature': _temperatureController.text,
                      'allergy': _allergyController.text,
                      'chronic_disease': _chronicController.text,
                      'has_contact_or_travel': _hasContactOrTravel,
                    };

                    Flushbar(
                      message: 'บันทึกอาการเรียบร้อยแล้ว',
                      backgroundColor: Colors.green,
                      messageColor: Colors.white,
                      margin: const EdgeInsets.all(16),
                      borderRadius: BorderRadius.circular(12),
                      duration: const Duration(seconds: 2),
                      flushbarPosition: FlushbarPosition.TOP,
                    ).show(context);

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: const Text(
                    //       'บันทึกอาการเรียบร้อยแล้ว',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     backgroundColor: Colors.green,
                    //     behavior: SnackBarBehavior.floating,
                    //     margin: const EdgeInsets.all(16),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     duration: const Duration(seconds: 2),
                    //   ),
                    // );

                    Future.delayed(const Duration(milliseconds: 300), () {
                      // _showPredictionDialog(patientData);
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
            ),
          ),
        );
      },
    );
  }

  Widget _buildInput(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownGender() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          hintText: 'เพศ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        items:
            ['ชาย', 'หญิง', 'อื่น ๆ'].map((value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
        onChanged: (value) {
          if (value != null) _selectedGender = value;
        },
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: _onsetDateController,
        readOnly: true,
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    onSurface: Colors.black,
                  ),
                  dialogBackgroundColor: Colors.white,
                ),
                child: child!,
              );
            },
          );
          if (picked != null) {
            _onsetDateController.text =
                "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
          }
        },
        decoration: InputDecoration(
          hintText: 'วันเริ่มมีอาการ (กดเลือกวันที่)',
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );

  double _calculateBMI(String weight, String height) {
    try {
      final w = double.parse(weight);
      final h = double.parse(height) / 100;
      return (h > 0) ? (w / (h * h)) : 0;
    } catch (_) {
      return 0;
    }
  }

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
    final List<IconData> icons = [
      Icons.local_hospital,
      Icons.healing,
      Icons.monitor_heart,
    ];
    return Column(
      children: List.generate(titles.length, (index) {
        final isSelected = selectedIndex == index;
        final icon = icons[index % icons.length];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });

            _showSymptomInputDialog(titles[index]);
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
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue[100] : Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: isSelected ? Colors.blue[800] : Colors.grey[700],
                    size: 20,
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

                // const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        );
      }),
    );
  }
}
