import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class FaceRecognitionScreen extends StatefulWidget {
  @override
  _FaceRecognitionScreenState createState() => _FaceRecognitionScreenState();
}

class _FaceRecognitionScreenState extends State<FaceRecognitionScreen> {
  CameraController? _cameraController;
  bool isCameraInitialized = false;
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _cameraController!.initialize();

      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      print('Failed to initialize camera: $e');
      if (mounted) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('ไม่สามารถเข้าถึงกล้องได้')),
        // );
      }
    }
  }

  Future<void> _takePictureAndUpload(BuildContext context) async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('กล้องยังไม่พร้อมใช้งาน')));
      return;
    }

    try {
      final XFile picture = await _cameraController!.takePicture();

      setState(() {
        isUploading = true;
      });

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://your-backend-api.com/face_recognition'),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          picture.path,
          filename: basename(picture.path),
        ),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        print('Upload success: $respStr');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('อัปโหลดภาพสำเร็จ')));

        Navigator.pushReplacementNamed(context, '/register');
      } else {
        print('Upload failed with status: ${response.statusCode}');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('อัปโหลดภาพไม่สำเร็จ')));
      }
    } catch (e) {
      print('Upload error: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('เกิดข้อผิดพลาดในการอัปโหลด')));
    } finally {
      setState(() {
        isUploading = false;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body:
          isCameraInitialized
              ? Stack(
                children: [
                  CameraPreview(_cameraController!),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.camera_alt,color: Colors.white,),
                        label:
                            isUploading
                                ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : Text(
                                  'ถ่ายรูปใบหน้า',
                                  style: TextStyle(color: Colors.white),
                                ),
                        onPressed:
                            isUploading
                                ? null
                                : () => _takePictureAndUpload(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
