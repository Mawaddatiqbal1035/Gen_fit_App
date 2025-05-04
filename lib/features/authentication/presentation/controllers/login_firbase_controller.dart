import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen_fit/core/error_handling/failure.dart';
import 'package:gen_fit/core/utils/app_constants/texts/app_authentication_texts_expanded.dart';
import 'package:gen_fit/database_sqflite.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/screens/home_screen2.dart';
import 'package:gen_fit/features/authentication/presentation/screens/signup_screen.dart';
import 'package:get/get.dart';
import '../../../../core/router/app_routes.dart';
import 'package:gen_fit/core/utils/app_constants/colors/app_colors.dart';

import '../../domain/entities/auth_failure.dart';

class LoginFirebaseController extends GetxController {
  LoginFirebaseController({required this.databaseHelper});
  Rx<User?> _user = Rx<User?>(null);
  FirebaseAuth auth = FirebaseAuth.instance;

  DatabaseHelper databaseHelper;
  User? get currentUser => _user.value;


  @override
  void onReady() {
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());

    ever(_user, initScreen);
    super.onReady();
  }

  void initScreen(User? user) {
    if (user == null) {
      Get.offNamed(AppRoutes.forGetScreen);
    } else {
      Get.offAllNamed(AppRoutes.homeScreen2);
    }
  }

  bool isValidEmail(String? email) {
    if (email == null || email.isEmpty) return false;

    final emailRegex = RegExp(
        r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegex.hasMatch(email);
  }

  Future<void> login({required String email, required String password,required BuildContext context}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      databaseHelper.loginUser(email, password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen2()));
    } catch (e) {
      if (e is FirebaseAuthException) {
        Get.snackbar("Login Failed", e.message ?? "Error in login",
            backgroundColor: Colors.red);
      } else {
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    }
  }

  Future<void> resetPassword(String email,String newPassword) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      databaseHelper.restPassword(email, newPassword);
      Get.snackbar("Success", "Password Reset Email Sent",
          backgroundColor: Colors.green);
    } catch (e) {
      if (e is FirebaseAuthException) {
        Get.snackbar("Reset Password Failed", e.message ?? "Invalid email",
            backgroundColor: Colors.red);
      } else {
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    }
  }

  signUp(String email, String password,
      BuildContext context,String userName) async {
    try {
    final signUser=  await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    signUser.user?.updateDisplayName(userName);
    signUser.user?.reload();
      final currentUser = auth.currentUser;
      if(currentUser!=null){
        databaseHelper.registerSignupData(email, password);
        //await currentUser.updateDisplayName(userName.capitalizeFirst);
       // currentUser.reload();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen2()));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            return Left(AuthFailure(
                field: 'email',
                code: e.code,
                Message: AppAuthenticationTextsExpanded.noUserFound));
          case 'wrong-password':
            return Left(AuthFailure(
                field: 'password',
                code: e.code,
                Message: AppAuthenticationTextsExpanded.incorrectPassword));
          case 'invalid-email':
            return Left(AuthFailure(
                field: 'email',
                code: e.code,
                Message: AppAuthenticationTextsExpanded.invalidEmail));
          case 'user-disabled':
            return Left(AuthFailure(
                field: 'email',
                code: e.code,
                Message: AppAuthenticationTextsExpanded.userDisabled));
          case 'too-many-requests':
            return Left(AuthFailure(
                code: e.code,
                Message: AppAuthenticationTextsExpanded.tooManyRequests));
          case 'network-request-failed':
            return Left(AuthFailure(
                code: e.code,
                Message: AppAuthenticationTextsExpanded.networkError));
          case 'invalid-credential':
            return Left(AuthFailure(
                code: e.code,
                Message: AppAuthenticationTextsExpanded.invalidCredential));
          default:
            return Left(AuthFailure(
                code: e.code,
                Message:
                "${AppAuthenticationTextsExpanded.authError} ${e.code} ${e
                    .message}"));
        }
      }
    }
  }
  logout(BuildContext context) async {
    try {
      if (auth.currentUser != null) {
        await auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignupScreen()));
      }
    } catch(e){
      print(Failure(errorMessage: e.toString()));
    }
    
  }
}
