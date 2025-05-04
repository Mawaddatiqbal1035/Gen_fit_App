// presentation/controllers/theme_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/usecase/theme_usecase.dart';

class ThemeController extends GetxController {
  final ThemeUseCase themeUseCase;

  ThemeController(this.themeUseCase);

  @override
  Future<void> onInit() async {

    super.onInit();
    final initialTheme = await themeUseCase.getInitialTheme();

    Get.changeThemeMode(initialTheme); // Apply the theme at startup
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    Get.changeThemeMode(newTheme); // Apply theme dynamically
    await themeUseCase.saveTheme(newTheme); // Persist user preference
  }
  Future<void> toggleTheme()async{
    var newTheme= Get.isDarkMode?ThemeMode.light:ThemeMode.dark;
    Get.changeThemeMode(newTheme);
    await themeUseCase.saveTheme(newTheme);
  }

}
