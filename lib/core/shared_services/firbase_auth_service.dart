import 'package:firebase_auth/firebase_auth.dart';
import 'package:gen_fit/core/router/app_routes.dart';
import 'package:gen_fit/features/authentication/presentation/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    enableLoginPersistence();
    super.onInit();
  }


  Rx<User?> _user=null.obs;
  FirebaseAuth auth=FirebaseAuth.instance;
  User? get _currentUser=>_user.value;

  Future<void> enableLoginPersistence({Persistence persistence=Persistence.NONE}) async {
    try {
      await auth.setPersistence(persistence);
    }catch(e){
      print(e.toString());
    };
  }

  @override
  void onReady() {
    // TODO: implement onReady
    _user=Rx(auth.currentUser);
    _user.bindStream(auth.authStateChanges());

    ever(_user, initScreen);
    super.onReady();
  }

  void initScreen(User? user){
    if(user==null){
      Get.offNamed(AppRoutes.forGetScreen);
    }
    else{
      Get.offAllNamed(AppRoutes.homeScreen2);
    }

  }

  Future<UserCredential> login({required String email,required String password}) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result;
    }on FirebaseAuthException catch (e) {
  rethrow;
    }catch(e){
      rethrow;
    }
  }

}