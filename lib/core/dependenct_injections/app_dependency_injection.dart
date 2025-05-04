import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

import '../../firebase_options.dart';
import '../shared_features/theme_management/theme_dependency_injection.dart';


class AppDependencyInjection {

  Future<void> init()async {
    try {
    await  GetStorage.init();
      ThemeDependencyInjection().dependencies();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      print('error $e');
    }
  }
}
