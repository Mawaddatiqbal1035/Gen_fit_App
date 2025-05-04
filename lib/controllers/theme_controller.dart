import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ThemeController2 extends GetxController{
  Rx<ThemeMode> themeMode=Rx(ThemeMode.light);
   changeTheme({required ThemeMode tm}){
  themeMode.value=tm;
  }
}