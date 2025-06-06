import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'camera_controller_pick_image.dart';

class GeminiController extends GetxController {
  GeminiController({required this.cameraControllerPickImage});

  final String apiKey = 'AIzaSyDc-LKrG1sPU6L9v31kXizSIflj8-GkHWQ';
  CameraControllerPickImage cameraControllerPickImage;

  Future<String> getExerciseRecommendation() async {
    final model = GenerativeModel(
      model: "gemini-pro-vision",
      apiKey: apiKey,
    );

    try {
      // **If Image is Selected, Analyze It**
      if (cameraControllerPickImage.file != null) {
        final imageBytes = await cameraControllerPickImage.file!.readAsBytes();
        print(" Image selected, sending to Gemini API...");

        final result = await model.generateContent([
          Content.model([
            DataPart(
              "Identify the exercise in the image and return ONLY the name of the "
                  "exercise. Examples: push-ups, squats, lunges, plank, bicep curls, "
                  "etc. "
                  "Do not add any extra words, titles, or descriptions. Just return "
                  "the exact exercise name.",
              imageBytes,
            )
          ])
        ]);

        print(" Gemini API Response: ${result.text}");
        return result.text?.trim() ?? "No exercise detected";
      }

      return "No relevant input";

    } catch (error) {
      print("Error during Gemini prediction: $error");
      return 'No exercise detected';
    }
  }
}