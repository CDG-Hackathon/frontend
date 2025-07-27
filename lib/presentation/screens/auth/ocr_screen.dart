import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class OcrScreen extends StatefulWidget {
  @override
  _OcrScreenState createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  Uint8List? frontImageBytes;
  Uint8List? backImageBytes;
  String extractedText = '';
  bool isLoading = false;

  // Future<Uint8List?> pickImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //     withData: true,
  //   );
  //   if (result == null || result.files.single.bytes == null) return null;
  //   return result.files.single.bytes!;
  // }

  final ImagePicker _picker = ImagePicker();

  Future<Uint8List?> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return null;
    return await pickedFile.readAsBytes();
  }

  Future<void> uploadImage(Uint8List imageBytes, String side) async {
    setState(() {
      isLoading = true;
      extractedText = '';
    });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://your-backend-api.com/ocr'),
      );
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          imageBytes,
          filename: '$side.jpg',
        ),
      );
      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final decoded = jsonDecode(responseBody);
        setState(() {
          extractedText = decoded['text'] ?? '';
        });

        bool isValid = RegExp(r'\d{13}').hasMatch(extractedText);

        if (isValid) {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  backgroundColor: Colors.green[100],
                  title: Text(
                    'สำเร็จ',
                    style: TextStyle(color: Colors.green[900]),
                  ),
                  content: Text('OCR อ่านข้อมูลบัตรประชาชนผ่าน'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'ตกลง',
                        style: TextStyle(color: Colors.green[900]),
                      ),
                    ),
                  ],
                ),
          );
        }
      } else {
        setState(() {
          extractedText = 'เกิดข้อผิดพลาดจาก backend (${response.statusCode})';
        });
      }
    } catch (e) {
      setState(() {
        extractedText = 'เกิดข้อผิดพลาด: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildCardSide(
    String label,
    Uint8List? imageBytes,
    VoidCallback onPick,
  ) {
    return GestureDetector(
      onTap: onPick,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 160,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
          ),
          child:
              imageBytes == null
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, color: Colors.blueGrey, size: 30),
                      SizedBox(height: 6),
                      Text(
                        'เพิ่มรูปบัตร\nด้าน${label}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.memory(imageBytes, fit: BoxFit.cover),
                  ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('สแกนบัตรประชาชน'),
      // ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'เพิ่มบัตรประชาชน',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 12, 105, 180),
                        ),
                      ),
                      SizedBox(height: 50),
                      buildCardSide('หน้า', frontImageBytes, () async {
                        Uint8List? picked = await pickImageFromGallery();
                        if (picked != null) {
                          setState(() {
                            frontImageBytes = picked;
                          });
                          await uploadImage(picked, 'front');
                        }
                      }),
                      SizedBox(height: 50),
                      buildCardSide('หลัง', backImageBytes, () async {
                        Uint8List? picked = await pickImageFromGallery();
                        if (picked != null) {
                          setState(() {
                            backImageBytes = picked;
                          });
                          await uploadImage(picked, 'back');
                        }
                      }),
                      SizedBox(height: 20),
                      if (isLoading) CircularProgressIndicator(),
                      if (!isLoading && extractedText.isNotEmpty) ...[
                        Text(
                          'ผลลัพธ์ OCR:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        SelectableText(extractedText),
                      ],
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                      if (frontImageBytes != null &&
                          backImageBytes != null &&
                          extractedText.isNotEmpty) {
                        Navigator.pushReplacementNamed(context, '/face');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'กรุณาอัปโหลดรูปบัตรทั้งสองด้านและรอผล OCR ก่อน',
                            ),
                            backgroundColor: Colors.red[400],
                          ),
                        );
                      }
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

