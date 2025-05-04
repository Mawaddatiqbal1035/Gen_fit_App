import 'dart:async';
/*import 'package:either_dart/either.dart';
import 'package:gen_fit/features/ai_workout_recommendication/data/data-sources/exercise_api_data_source.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/entities/exercise_entity.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/repositories/exercise_repository.dart';
import '../../../../core/error_handling/failure.dart';
import 'package:get/get.dart';

class ExerciseUsecase {
  ExerciseRepository exerciseRepository;

  ExerciseUsecase( this.exerciseRepository);

  Stream<Either<Failure, ExerciseEntity>> execute() async* {
    try {
      while (true) {
        yield* await exerciseRepository.getExercise();
        print('exercise repository');
        await Future.delayed(const Duration(seconds: 3));

      }
    }catch(error){
      yield  Left(Failure(errorMessage: error.toString()));
    }
  }
}*/