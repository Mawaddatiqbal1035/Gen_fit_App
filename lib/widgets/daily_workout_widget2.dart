/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gen_fit/features/ai_workout_recommendication/data/data-sources/exercise_api_data_source.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/repositories/exercise_repository.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/usecase/exercise_use_case.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/controllers/gemini_controller.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/controllers/youtube_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../features/ai_workout_recommendication/data/models/exercise_data_model.dart';
import '../features/ai_workout_recommendication/presentation/controllers/camera_controller_pick_image.dart';

class DailyWorkoutWidget2 extends StatelessWidget {
  const DailyWorkoutWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    final cameraController = Get.find<CameraControllerPickImage>();
    final s = MediaQuery.of(context).size;

    return Obx(() {
      final youtubeController = Get.put(YoutubeController(ExerciseUseCase(exerciseRepository:
      ExerciseRepository(dataSource: ExerciseApiDataSource()))));

      // Here you might want to check if the image is processed
      return Center(
        child: youtubeController.isLoading.value
            ? CircularProgressIndicator()
            : youtubeController.isError.value
            ? Text(youtubeController.errorMessage.value)
            : Column(
          children: [
            Container(
              height: 150,
              width: s.width * 0.96,
              child: cameraController.pickedFile != null
                  ? Image.file(File(cameraController.pickedFile!.path), fit: BoxFit.cover)
                  : Placeholder(),  // If no image, show a placeholder
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
            children: [
              Column(
                  children: [
                    Image.network(youtubeController.weatherEntity.value!.urlHigh),
                    // Video title
                    Text('https://www.youtube.com/watch?v=Sou12pLJFCc${
                        youtubeController.weatherEntity.value?.channelId}'),
                  ],
                ),
            ],
              )
              ),
          ],
        ),
      );
    });
  }
}*/
