
import 'package:gen_fit/features/ai_workout_recommendication/presentation/screens/home_screen2.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/authentication/presentation/screens/forget_screen.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/signup_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/onboard_screen.dart';
import '../../screens/onboard_screen2.dart';

class AppRoutes{
  static const root='/';
  static const login='/login';
  static const homeScreen='/homeScreen';
  static const signUpScreen='/signUpScreen';
  static const onBoardScreen1='/onBoardScreen1';
  static const onBoardScreen2='/onBoardScreen2';
  static const forGetScreen='/forGetScreen';
  static const homeScreen2='/homeScreen2';

static final getPages=[
 GetPage(name: login, page:()=> LoginScreen()),
  GetPage(name: signUpScreen, page:()=> SignupScreen()),
  GetPage(name: forGetScreen, page:()=> ForgotPasswordScreen()),
  GetPage(name: homeScreen, page:()=> HomeScreen()),
  GetPage(name: onBoardScreen1, page:()=> OnBoardScreen()),
  GetPage(name: onBoardScreen2, page:()=>OnBoardScreen2(),),
  GetPage(name: homeScreen2, page:()=>HomeScreen2(),)
];

}