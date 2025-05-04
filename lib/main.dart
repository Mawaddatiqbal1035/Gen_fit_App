import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gen_fit/core/router/app_routes.dart';
import 'package:gen_fit/features/ai_workout_recommendication/data/data-sources/exercise_api_data_source.dart';
import 'package:gen_fit/features/authentication/presentation/screens/forget_screen.dart';
import 'package:gen_fit/features/authentication/presentation/screens/signup_screen.dart';
import 'controllers/onBoard_get_controller.dart';
import 'controllers/onboard_Controller.dart';
import 'controllers/theme_controller.dart';
import 'core/dependenct_injections/app_dependency_injection.dart';
import 'core/shared_features/theme_management/presentation/controllers/theme_controller.dart';
import 'features/ai_workout_recommendication/presentation/screens/home_screen2.dart';
import 'features/ai_workout_recommendication/presentation/screens/home_screen3.dart';
import 'features/authentication/presentation/screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/onboard_screen.dart';
import 'screens/onboard_screen2.dart';
import 'package:get/get.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencyInjection().init();
  Get.put<OnBoardGetController>(OnBoardGetController());
  Get.put<ThemeController2>(ThemeController2());
  String apiKey = "AIzaSyDc-LKrG1sPU6L9v31kXizSIflj8-GkHWQ";
  Gemini.init(apiKey: apiKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.setSettings(
    appVerificationDisabledForTesting: true,
  );
  runApp(const MyApp());
}

//bool isDark=true;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx((){
      final x=Get.find<ThemeController2>();
         return GetMaterialApp(
          theme: MyTheme.light(),
          darkTheme: MyTheme.dark(),
          themeMode: x.themeMode.value, // ThemeController's themeMode value
          debugShowCheckedModeBanner: false,
          home:  Obx((){
      final onboard=Get.find<OnBoardGetController>();
      return onboard.isLogin.value==true ?HomeScreen2():HomeScreen2();
      }));});

  }
}

class MyTheme {
  static ThemeData light() {
    return ThemeData(
      drawerTheme: DrawerThemeData(
         backgroundColor: Color(0xFFD1CAFF).withOpacity(0.79),
      ),
      hintColor: Color(0xFF6F6B88).withOpacity(0.66),
      brightness: Brightness.light,

    //  iconTheme: IconThemeData(color: Color(0xFF6F6B88).withOpacity(0.66)),
      textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.black.withOpacity(0.880)),
          bodyLarge: TextStyle(color: Color(0xFF9F7EFE)),
          displayLarge: TextStyle(color: Colors.black.withOpacity(0.9)),
          bodyMedium: TextStyle(color: Colors.black)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFFD1CAFF).withOpacity(0.79),),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Color(0xFFD1CAFF).withOpacity(0.79),
        // Applying lightened color
        filled: true,
        labelStyle: TextStyle(
          color: Color(0xFF9F7EFE).withOpacity(0.9),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      drawerTheme: DrawerThemeData(
         backgroundColor: Colors.grey,
      ),
      switchTheme: SwitchThemeData(overlayColor:WidgetStatePropertyAll(Colors.black) ),
      hintColor: Color(0xFF6F6B88).withOpacity(0.66),
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
          bodySmall: TextStyle(
            color: Colors.black.withOpacity(0.880),
          ),
          bodyLarge: TextStyle(color: Color(0xFF9F7EFE)),
          displayLarge: TextStyle(color: Colors.black.withOpacity(0.9)),
          bodyMedium: TextStyle(color: Colors.white)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor:Colors.grey,
        filled: true,
        labelStyle: TextStyle(
          color: Color(0xFF9F7EFE).withOpacity(0.9),
        ),
      ),
    );
  }
}