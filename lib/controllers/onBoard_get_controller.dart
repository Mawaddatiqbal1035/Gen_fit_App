import 'package:get/get.dart';
class OnBoardGetController extends GetxController{
  Rx<String> passward='123'.obs;
  Rx<String> eMail='123'.obs;
  Rx<bool> isLogin=false.obs;
  Rx<bool> isError=false.obs;
  Rx<bool> ischeck=false.obs;
  Rx<bool> forGet=false.obs;




  login({required String passw,required String userEmail}){
    isLogin.value=  passw==passward.value&&userEmail==eMail.value?  true:false;
    print(isLogin);
  }


  signUp({required String userPassword,required String confirmPass,required String userName}){
    if(userPassword==passward.value&&confirmPass==userPassword)
    {
      isLogin.value=   true;
      isError.value=  false;


    }
    else
    {
      isLogin.value=false;
      isError.value=true;

    };
  }




  logOut(){
    isLogin.value=false;
  }

  forgetPassword({required String userEmail}){
forGet.value= (userEmail==eMail.value)?true:false;
  }

}


