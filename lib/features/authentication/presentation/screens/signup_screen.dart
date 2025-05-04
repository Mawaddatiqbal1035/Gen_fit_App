
import 'package:flutter/material.dart';
import 'package:gen_fit/database_sqflite.dart';
import 'package:gen_fit/features/authentication/presentation/controllers/login_firbase_controller.dart';
import 'package:gen_fit/features/authentication/presentation/screens/login_screen.dart';
import 'package:get/get.dart';

import '../../../../controllers/onBoard_get_controller.dart';
import '../../../../core/utils/app_constants/app_assets/app_assets.dart';
import '../../../../core/utils/app_constants/texts/app_authentication_texts_expanded.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final onBoardControllerSignUp=Get.put(LoginFirebaseController(databaseHelper: DatabaseHelper()));
    return SafeArea(
        child:
        Scaffold(
          backgroundColor: const Color(0xFFEEECEC),
          body: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Center(
                      child: Container(
                        width: s.width * 0.25,
                        height: s.height * 0.07,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E4FF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            AppAuthenticationTextsExpanded.signup,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: s.width * 0.020 + s.height * 0.019,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),

            // Image Section
            SliverToBoxAdapter(
              child: Center(
                child: Image(
                  image: const AssetImage(AppAssets.signUpAsset),
                  height: s.height * 0.240,
                  width: s.width * 0.60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 4)),

            // Form Section
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppAuthenticationTextsExpanded.userName,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: s.width * 0.015 + s.height * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3,),
                        TextField(
                          controller: userNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintStyle: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: s.width * 0.013 + s.height * 0.010,
                            ),
                            hintText: AppAuthenticationTextsExpanded.signupUserHintText,
                            alignLabelWithHint: true,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          AppAuthenticationTextsExpanded.eMail,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: s.width * 0.015 + s.height * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        TextField(
                          controller: emailTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintStyle: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: s.width * 0.013 + s.height * 0.010,
                            ),
                            hintText: AppAuthenticationTextsExpanded.signupUserHintText,
                            alignLabelWithHint: true,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppAuthenticationTextsExpanded.signupPassword,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: s.width * 0.016 + s.height * 0.016,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        TextField(
                          controller: passwordTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintStyle: TextStyle(
                              fontSize: s.width * 0.013 + s.height * 0.010,
                              color: Theme.of(context).hintColor,
                            ),
                            hintText: AppAuthenticationTextsExpanded.signupPasswordHintText,
                            alignLabelWithHint: true,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Signup Button Section
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                   onBoardControllerSignUp.signUp(emailTextController.text.trim(),passwordTextController.text.trim(),
                       context,userNameController.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    shadowColor: Colors.grey,
                    elevation: 4.89,
                    fixedSize: Size(s.width * 0.16, s.height * 0.16),
                    iconColor: Colors.black,
                    backgroundColor: Color(0xFFD1CAFF).withOpacity(0.79),
                  ),
                  child: const Icon(Icons.login, color: Color(0xFF1C1B1F)),
                ),
              ),
            ),

            // Footer Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Divider(
                            thickness: 1,
                            color: Colors.black.withOpacity(0.30),
                          ),
                        ),
                      ),
                      Text(
                        AppAuthenticationTextsExpanded.orSignupWith,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Divider(
                            thickness: 1,
                            color: Colors.black.withOpacity(0.30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3), // Reduced spacing

                  // Social Media Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color(0xFFD1CAFF).withOpacity(0.79),),
                          fixedSize: MaterialStateProperty.all(
                              Size(s.height * 0.130, s.width * 0.080)),
                          shape: MaterialStateProperty.all(
                              const BeveledRectangleBorder()),
                        ),
                        child: const Icon(Icons.g_mobiledata_rounded,
                            color: Color(0xFF9F7EFE),),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color(0xFFD1CAFF).withOpacity(0.79),),
                          fixedSize: MaterialStateProperty.all(
                              Size(s.height * 0.130, s.width * 0.080)),
                          shape: MaterialStateProperty.all(
                              const BeveledRectangleBorder()),
                        ),
                        child:
                        const Icon(Icons.facebook, color: Color(0xFF9F7EFE)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Spacing remains same

                  // Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       AppAuthenticationTextsExpanded.alreadyHaveAccount,
                        style: TextStyle(
                          fontSize: s.width * 0.010 + s.height * 0.010,
                          color: const Color(0xFF9F7EFE),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Text(
                          AppAuthenticationTextsExpanded.loginNow,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        style: ButtonStyle(     backgroundColor: WidgetStatePropertyAll(Color(0xFFD1CAFF).withOpacity(0.79),),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ));


  }
}
