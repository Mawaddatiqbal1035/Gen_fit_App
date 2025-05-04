import 'package:gen_fit/core/shared_services/firbase_auth_service.dart';
import 'package:gen_fit/database_sqflite.dart';
import 'package:gen_fit/features/authentication/data/auth_repository_impl.dart';
import 'package:gen_fit/features/authentication/domain/usecase/forget_usecase.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gen_fit/core/utils/app_constants/colors/app_colors.dart';
import '../../../../core/utils/app_constants/texts/app_authentication_texts_expanded.dart';
import '../controllers/login_firbase_controller.dart';
import '../widgets/my_textfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final eMailController=TextEditingController();
    final newPasswordController=TextEditingController();
    final loginComponentController=Get.put(LoginFirebaseController(databaseHelper: DatabaseHelper()));
    return Scaffold(
      backgroundColor: Color(0xFFEEECEC),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:   CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 9),
                child: BackButton(
                  color: AppColors.lightPrimary,
                ),
              ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 9),
                    child: Text(
                      AppAuthenticationTextsExpanded.forgetPasswordText,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: s.width * 0.014 + s.height * 0.014,),
                    ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 9),
                child: Text(AppAuthenticationTextsExpanded.enterTheEmailAccount),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: MyTextfieldWidget(hintText: AppAuthenticationTextsExpanded.forgetHintText, title: 'Email', errorMessage: 'invalid email',
                    controller: eMailController),
              ),
              SizedBox(height: 80),
              Padding(
                padding:  EdgeInsets.only(right: 28,left: 28),
                child: ElevatedButton(
                  onPressed: () {
                    loginComponentController.resetPassword(eMailController.text.trim(),newPasswordController.text.trim());},
                  child: Text(AppAuthenticationTextsExpanded.sendCode),
                  style:ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.lightPrimary),
                    fixedSize: WidgetStatePropertyAll(Size(s.width * 0.999, s.height * 0.017,)
                    ),

                  ),
                ),
              ) ],
          ),
        ),
      ),
    );
  }
}




