import 'package:gen_fit/core/shared_services/firbase_auth_service.dart';
import 'package:gen_fit/features/authentication/data/auth_repository_impl.dart';
import 'package:gen_fit/features/authentication/domain/usecase/forget_usecase.dart';
import 'package:get/get.dart';

class ForgetComponentControllerBindling extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>AuthRepositoryImpl(Get.find<FirebaseAuthService>()),fenix: true);
    Get.lazyPut(()=>ForgetUsecase(Get.find<AuthRepositoryImpl>()),fenix: true);
    //Get.lazyPut(()=>ForgetComponentController(Get.find<ForgetUsecase>()),fenix: true);
    // TODO: implement dependencies
  }
  
  
}