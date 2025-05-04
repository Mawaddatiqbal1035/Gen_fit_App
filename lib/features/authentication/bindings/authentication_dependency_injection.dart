import 'package:gen_fit/core/shared_services/firbase_auth_service.dart';
import 'package:get/get.dart';

class AuthenticationDepdendencyInjection extends Bindings{

  @override
  void dependencies() {
    Get.put(FirebaseAuthService());
    // TODO: implement dependencies
  }
}