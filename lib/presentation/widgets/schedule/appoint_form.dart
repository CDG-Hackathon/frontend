import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/schedule/dot_loading_animation.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  String? hospitalRight;
  String? selectedHospital;

  Widget _buildStyledContainer({
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16,
      // vertical: 4,
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

  Widget _buildHospitalInfo({
    required String name,
    required String distance,
    required int queue,
    required int rank,
    required bool hasSpecialist,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Colors.blue[700], size: 20),
              const SizedBox(width: 6),
              Text(
                '$rank. $name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('ระยะทาง: $distance'),
          Text('จำนวนคิวรอ: $queue คน'),
          if (hasSpecialist)
            const Text(
              'มีแพทย์เฉพาะทางด้านนี้',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
            ),
        ],
      ),
    );
  }

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
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: content,
        ),
      ],
    );
  }

  Widget _buildHospitalButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? const Color.fromARGB(255, 12, 105, 180)
                    : const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromARGB(255, 71, 141, 212)),
          ),
          child: Text(
            label,
            style: TextStyle(
              color:
                  isSelected
                      ? Colors.white
                      : const Color.fromARGB(255, 12, 105, 180),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Center(
        child: SizedBox(
          width: 430,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildSection(
                title: 'สิทธิการรักษา',
                content: _buildStyledContainer(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 0,
                    ),
                    child: Text(
                      hospitalRight ?? '-',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 12, 105, 180),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'เลือกโรงพยาบาล',
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 105, 180),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        // showDialog(
                        //   context: context,
                        //   barrierDismissible: false,
                        //   builder: (context) {
                        //     return const Center(
                        //       child: CircularProgressIndicator(color: Colors.blue,),
                        //     );
                        //   },
                        // );
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor:
                              Colors.transparent, 
                          builder: (context) {
                            return Center(
                              child: DotLoadingAnimation(
                                dotSize: 14,
                                dotColor: Colors.blue,
                              ),
                            );
                          },
                        );

                        await Future.delayed(const Duration(seconds: 2));

                        Navigator.of(context).pop();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              insetPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 24,
                              ),
                              title: const Text(
                                "AI แนะนำโรงพยาบาล",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 6, 103, 183),
                                ),
                              ),
                              content: SizedBox(
                                width: 400,
                                height: 500,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/map_prototype2.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Stack(
                                        children: [
                                          const Positioned(
                                            top: 80,
                                            left: 160,
                                            child: Icon(
                                              Icons.person_pin_circle,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                          ),

                                          const Positioned(
                                            top: 20,
                                            left: 50,
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.local_hospital,
                                                  color: Colors.green,
                                                  size: 24,
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'รพ.รามาธิบดี',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          const Positioned(
                                            top: 50,
                                            left: 250,
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.local_hospital,
                                                  color: Colors.green,
                                                  size: 24,
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'รพ.ศิริราช',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          const Positioned(
                                            top: 140,
                                            left: 100,
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.local_hospital,
                                                  color: Colors.green,
                                                  size: 24,
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'รพ.จุฬาฯ',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    Expanded(
                                      child: ListView(
                                        children: [
                                          _buildHospitalInfo(
                                            name: 'รพ.ศิริราช',
                                            distance: '2.4 กม.',
                                            queue: 30,
                                            rank: 1,
                                            hasSpecialist: true,
                                          ),
                                          const SizedBox(height: 8),
                                          _buildHospitalInfo(
                                            name: 'รพ.รามาธิบดี',
                                            distance: '1.2 กม.',
                                            queue: 45,
                                            rank: 2,
                                            hasSpecialist: true,
                                          ),
                                          const SizedBox(height: 8),
                                          _buildHospitalInfo(
                                            name: 'รพ.จุฬาฯ',
                                            distance: '3.1 กม.',
                                            queue: 62,
                                            rank: 3,
                                            hasSpecialist: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    "ปิด",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: 'AI แนะนำโรงพยาบาล',
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 105, 180),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 0, 82, 155),
                            decorationThickness: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildStyledContainer(
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
              _buildHospitalButton(
                label: 'โรงพยาบาลศิริราช',
                isSelected: selectedHospital == 'โรงพยาบาลศิริราช',
                onTap: () {
                  setState(() {
                    selectedHospital = 'โรงพยาบาลศิริราช';
                    hospitalRight = 'สิทธิบัตรทอง';
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildHospitalButton(
                label: 'โรงพยาบาลรามาธิบดี',
                isSelected: selectedHospital == 'โรงพยาบาลรามาธิบดี',
                onTap: () {
                  setState(() {
                    selectedHospital = 'โรงพยาบาลรามาธิบดี';
                    hospitalRight = '-';
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildHospitalButton(
                label: 'โรงพยาบาลจุฬาฯ',
                isSelected: selectedHospital == 'โรงพยาบาลจุฬาฯ',
                onTap: () {
                  setState(() {
                    selectedHospital = 'โรงพยาบาลจุฬาฯ';
                    hospitalRight = 'สิทธิบัตรทอง';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
