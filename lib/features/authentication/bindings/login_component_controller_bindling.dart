import 'package:gen_fit/features/authentication/data/auth_repository_impl.dart';
import 'package:gen_fit/features/authentication/domain/usecase/login_usecase.dart';
import 'package:get/get.dart';

import '../../../core/shared_services/firbase_auth_service.dart';

class LoginComponentControllerBindling extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthRepositoryImpl(Get.find<FirebaseAuthService>()),fenix: true);
    Get.lazyPut(()=>LoginUsecase(Get.find<AuthRepositoryImpl>()),fenix: true);
   // Get.lazyPut(()=>LoginConponentController(Get.find<LoginUsecase>()),fenix: true);
    // TODO: implement dependencies
  }

}