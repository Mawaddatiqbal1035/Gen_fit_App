
import 'package:flutter/src/material/app.dart';
import 'package:get_storage/get_storage.dart';

import '../../domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository{
  ThemeRepositoryImpl(this.storage);
  final GetStorage storage;
  @override
  Future<ThemeMode?> getTheme ()async {
    // TODO: implement getTheme
    final themeString=storage.read<String>('themeMode');
   if(themeString==null)return null;
   return themeString=='dark'? ThemeMode.dark:ThemeMode.light;
  }


  @override
  Future<void> saveTheme(ThemeMode themeMode) {
    // TODO: implement saveTheme
    final themeString=themeMode==ThemeMode.dark?'dark':'light';
   return storage.write('themeMode', themeString);
  }


}