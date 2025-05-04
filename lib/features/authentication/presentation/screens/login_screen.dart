import 'package:flutter/material.dart';
import 'package:gen_fit/database_sqflite.dart';
import 'package:gen_fit/features/authentication/presentation/controllers/login_firbase_controller.dart';
import 'package:gen_fit/features/authentication/presentation/screens/forget_screen.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_constants/app_assets/app_assets.dart';
import '../../../../core/utils/app_constants/texts/app_authentication_texts_expanded.dart';
import '../widgets/my_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super. key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordTextController = TextEditingController();

  final eMailTextController = TextEditingController();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    //final onBoardGetController=Get.find<OnBoardGetController>();
    final onBoardControllerSignUp=Get.put(LoginFirebaseController(databaseHelper: DatabaseHelper()));
    final email=TextEditingController().text;
    final password=TextEditingController().text;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFEEECEC),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login Button
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: s.width * 0.27,
                          height: s.height * 0.07,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8E4FF),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              AppAuthenticationTextsExpanded.login,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: s.width * 0.020 + s.height * 0.020,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Image
                  Image(image: AssetImage(AppAssets.loginAsset),
                    height: s.height * 0.355,
                    width: s.width * 0.700,
                    fit: BoxFit.contain,),
                  const SizedBox(height: 1),
                  // Email TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: MyTextfieldWidget(
                      hintText: AppAuthenticationTextsExpanded.eMailHintText,
                      title: AppAuthenticationTextsExpanded.eMail,
                      errorMessage:AppAuthenticationTextsExpanded.invaildEmail,
                      controller: eMailTextController,

                    ),
                  ),
                  const SizedBox(height: 5),
                  // Password TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: MyTextfieldWidget(
                      hintText: AppAuthenticationTextsExpanded.passwordHintText,
                      title: AppAuthenticationTextsExpanded.password,
                      errorMessage: AppAuthenticationTextsExpanded.passwordNotMatch,
                      controller: passwordTextController,

                    ),),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                               setState(() {
                                 rememberMe = value!;
                               });
                              },
                            ),
                            Text(
                              AppAuthenticationTextsExpanded.rememberMe,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                fontSize: s.width * 0.0080 +
                                    s.height * 0.0081,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                          },
                          child: Text(
                            AppAuthenticationTextsExpanded.forgetPassword,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              fontSize: s.width * 0.0080 + s.height * 0.0081,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Pressed elevated button');
                   onBoardControllerSignUp.login(email: eMailTextController.text.trim(), password: passwordTextController.text.trim(), context: context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD1CAFF).withOpacity(0.79),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      shadowColor: Colors.grey,
                      elevation: 4.5,
                      fixedSize: Size(s.width * 0.19, s.height * 0.19),
                    ),
                    child: const Icon(Icons.login),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      color: const Color(0xFF9F7EFE),
                      borderRadius: BorderRadius.circular(25),
                      value: 0.9,
                      minHeight: 13,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );

  }
}
