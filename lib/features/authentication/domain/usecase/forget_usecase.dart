import 'package:gen_fit/features/authentication/data/auth_repository_impl.dart';
import 'package:gen_fit/features/authentication/domain/usecase/login_usecase.dart';
import 'package:get/get.dart';

class ForgetUsecase extends GetxController{

  ForgetUsecase(this.authRepositoryImpl);
  final AuthRepositoryImpl authRepositoryImpl;

  forgetExecute(String email)async {
    try {
      authRepositoryImpl.sendPasswordResetEmail(email);
    }catch(e){
      throw Exception(e);
    }
  }

}