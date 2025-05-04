import 'package:flutter/material.dart';

import '../repositories/theme_repository.dart';

class ThemeUseCase{
  final ThemeRepository repository;

  ThemeUseCase(this.repository);


  Future<ThemeMode> getInitialTheme() async {
    final themeMode = await repository.getTheme();
    return themeMode ?? ThemeMode.system; // Default to system theme
  }


  Future<void> saveTheme(ThemeMode themeMode) async {
    await repository.saveTheme(themeMode);
  }
}