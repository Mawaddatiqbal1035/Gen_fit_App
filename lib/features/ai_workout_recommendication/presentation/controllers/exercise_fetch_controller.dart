/*import 'dart:async';
import 'package:gen_fit/features/ai_workout_recommendication/data/data-sources/exercise_api_data_source.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/entities/exercise_entity.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/repositories/exercise_repository.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/usecase/exercise_usecase.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/controllers/camera_controller_pick_image.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/controllers/gemini_controller.dart';
import 'package:get/get.dart';
import 'package:either_dart/either.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/error_handling/failure.dart';

class ExerciseFetchController extends GetxController {
  ExerciseFetchController();
   ExerciseUsecase exerciseUsecase=Get.put(ExerciseUsecase(ExerciseRepository(dataSource: ExerciseApiDataSource())));
  final CameraControllerPickImage cameraControllerPickImage=Get.put(CameraControllerPickImage());
  final GeminiController geminiController=Get.put(GeminiController(cameraControllerPickImage: CameraControllerPickImage()));



  Rx<bool> isLoading = false.obs;
  Rx<bool> isError = false.obs;
  Rx<String> errorMessage = ''.obs;
  Rx<ExerciseEntity?> weatherEntity = Rxn<ExerciseEntity>();
 var exerciseText='';


  StreamSubscription<Either<Failure, ExerciseEntity>>? streamSubscription;
  @override
  void onInit() {
    super.onInit();
    getExercise();
  }
  void getExercise()async {
    print("Fetching exercise...");
    cameraControllerPickImage.pickImage(ImageSource.gallery);
   exerciseText = await geminiController.getExerciseRecommendation();
    // show gemini result
    streamSubscription = exerciseUsecase.execute().listen(
          (result) {
        print("Received data: $result");
        result.fold(
              (failure) {
            print("Failure: ${failure.errorMessage}");
            isLoading.value = false;
            isError.value = true;
            errorMessage.value = failure.errorMessage;
          },
              (success) {
            print("Success: $success"); // Debugging Log
            isLoading.value = false;
            isError.value = false;
            weatherEntity.value = success;
          },
        );
      },
      onError: (error) {
        print("Stream Error: $error"); // Debugging Log
        isLoading.value = false;
        isError.value = true;
        errorMessage.value = error.toString();
      },
      onDone: () {
        print("Stream Completed");
      },
    );
  }


  @override
  void onClose() {
    streamSubscription?.cancel();
    super.onClose();
  }



}*/
