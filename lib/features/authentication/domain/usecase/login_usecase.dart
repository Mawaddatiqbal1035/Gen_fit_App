import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gen_fit/core/error_handling/failure.dart';
import 'package:gen_fit/features/authentication/data/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../entities/auth_failure.dart';

class LoginUsecase{
  LoginUsecase(this.authRepositoryImpl);
  final AuthRepositoryImpl authRepositoryImpl;

  execute(String email,String password ,final isRememberMe)async {
    try {
      if(isRememberMe){

      await  authRepositoryImpl.enableLocalPersistence(Persistence.LOCAL);
      }

      final result = authRepositoryImpl.login(email, password);
      result.fold((failure) {
        return Left(failure);
      }, (success) {
        return Right(success);
      });
    }catch(e){
      throw Failure(errorMessage: e.toString());
    }
  }
}