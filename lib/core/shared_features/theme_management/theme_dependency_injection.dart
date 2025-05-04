
import 'package:gen_fit/core/shared_features/theme_management/presentation/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/theme_repository_impl.dart';
import 'domain/repositories/theme_repository.dart';
import 'domain/usecase/theme_usecase.dart';


class ThemeDependencyInjection extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<GetStorage>(()=>GetStorage(),fenix: true);

    Get.lazyPut<ThemeRepository>(()=>ThemeRepositoryImpl(Get.find()),fenix: true);
    
    Get.lazyPut<ThemeUseCase>(()=>ThemeUseCase(Get.find()),fenix: true);

    Get.put<ThemeController>( ThemeController(ThemeUseCase(ThemeRepositoryImpl(GetStorage()))));
  }


}