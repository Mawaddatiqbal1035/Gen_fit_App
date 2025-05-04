import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OnBoardController extends ChangeNotifier{
  String passward='123';
  String eMail='mawaddatiqbal123@gmail.com';
  bool isLogin=false;
  bool isError=false;
  bool ischeck=false;
  login({required String passw,required String userEmail}){
  isLogin=  passw==passward&&userEmail==eMail?  true:false;
  print(isLogin);
    notifyListeners();
  }


  signUp({required String userPassword,required String confirmPass,required String userName}){
  if(userPassword==passward&&confirmPass==userPassword)
  {
   isLogin=   true;
   isError=  false;


  }
  else
    {
      isLogin=false;
      isError=true;

    };
    notifyListeners();
  }




  logOut(){
    isLogin=false;
    notifyListeners();
  }

  }


