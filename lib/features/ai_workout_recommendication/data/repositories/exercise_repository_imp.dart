/*import 'package:either_dart/either.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/usecase/exercise_usecase.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/controllers/camera_controller_pick_image.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/controllers/exercise_fetch_controller.dart';
import '../../../../core/error_handling/failure.dart';
import '../../domain/entities/exercise_entity.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../../presentation/controllers/gemini_controller.dart';
import '../data-sources/exercise_api_data_source.dart';
import '../models/exercise_data_model.dart';
import 'package:get/get.dart';

class ExerciseRepositoryImp implements ExerciseRepository {
  final ExerciseApiDataSource dataSource;
  final exerciseFetchController=Get.put(ExerciseFetchController());
 //  ExerciseFetchController exerciseFetchController;

  ExerciseRepositoryImp( {required this.dataSource});

  ExerciseEntity exerciseEntityConvertor(ExerciseDataModel exerciseDataModel) {
    return ExerciseEntity(
      title: exerciseDataModel.title,
      description: exerciseDataModel.description,
      thumbnails: exerciseDataModel.thumbnails,
      videoId: exerciseDataModel.videoId,
    );
  }

  @override
  Stream<Either<Failure, ExerciseEntity>> getExercise() async* {
    try {
      if (exerciseFetchController.exerciseText.isNotEmpty) {
        final exerciseDataModel = await dataSource.fetchYouTubeVideo(exerciseFetchController.exerciseText);
        print(' Fetching exercise data from YouTube API...');
        final exerciseEntity = exerciseEntityConvertor(exerciseDataModel);
        yield Right(exerciseEntity);
        print('exerciseEntity created successfully');
      }
    } catch (error) {
      yield Left(Failure(errorMessage: error.toString()));
    }
  }
}*/
