import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraControllerPickImage extends GetxController {
  File? file;
  late final FaceDetector _faceDetector;
  var isProcessing = false.obs;
  var faces = <Face>[].obs;
  CameraControllerPickImage() {
    _initializeFaceDetector();
  }

  void _initializeFaceDetector() {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableClassification: true,
      ),
    );
  }

  Future<void> pickImage(ImageSource cameraSource) async {
    print(" Picking Image...");

    final pickedFile = await ImagePicker().pickImage(source: cameraSource);

    if (pickedFile != null) {
      file = File(pickedFile.path);
      print(" Image Selected: ${file!.path}");
      update();
      await detectFaces();
    } else {
      print(" No Image Picked");
    }
  }

  Future<void> detectFaces() async {
    if (isProcessing.value) return;
    if (file == null) {
      print(" No Image Selected for Face Detection");
      return;
    }

    isProcessing.value = true;

    try {
      print(" Detecting faces...");
      final inputImage = InputImage.fromFilePath(file!.path);
      final detectedFaces = await _faceDetector.processImage(inputImage);
      faces.assignAll(detectedFaces);
      print("Faces Detected: ${faces.length}");
    } catch (e) {
      print(" Face Detection Error: $e");
    } finally {
      isProcessing.value = false;
    }
  }

  @override
  void onClose() {
    _faceDetector.close();
    super.onClose();
  }

  pickImageDrawer(ImageSource imageSource)async {
    final fileImage = await ImagePicker().pickImage(source: imageSource);
    if (fileImage == null) {
      return "No image selected";
    }else{
      file = File(fileImage.path);
      return file;
    }
  }
}
