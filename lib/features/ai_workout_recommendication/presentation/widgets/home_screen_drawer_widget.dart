import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen_fit/controllers/onBoard_get_controller.dart';
import 'package:gen_fit/core/utils/app_constants/colors/app_colors.dart';
import 'package:gen_fit/database_sqflite.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/controllers/camera_controller_pick_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/shared_features/theme_management/data/repositories/theme_repository_impl.dart';
import '../../../../core/shared_features/theme_management/domain/usecase/theme_usecase.dart';
import '../../../../core/shared_features/theme_management/presentation/controllers/theme_controller.dart';
import '../../../authentication/presentation/controllers/login_firbase_controller.dart';

class HomeScreenDrawerWidget extends StatelessWidget {
  HomeScreenDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController=Get.put(CameraControllerPickImage());
    Get.put(ThemeController(ThemeUseCase(ThemeRepositoryImpl(GetStorage()))));
    final themeController = Get.find<ThemeController>();
    final onBoardControllerSignUp=Get.put(LoginFirebaseController(databaseHelper: DatabaseHelper()));
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Theme.of(context).drawerTheme.backgroundColor
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                      Stack(
                        children: [
                           CircleAvatar(
                            
                           // backgroundImage:imageController.file!=null?FileImage(File(imageController.file!.path)):null,
                          radius: 40,
                          child: imageController.imageFile!=null? Image.file(File(imageController.imageFile!.path),fit: BoxFit.fill):Icon(Icons.person, size: 55),
                        ),

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPrimary,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  imageController.pickImageDrawer(ImageSource.gallery);
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ]),
                Text("${onBoardControllerSignUp.auth.currentUser?.displayName?.capitalizeFirst}")
              ],
            ),
          ),
          ListTile(
            title: const Text("ThemeMode"),
            trailing: CupertinoSwitch(
              applyTheme: true,
              focusColor: Color(0xFF9F7EFE),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (newTheme) {
                themeController.toggleTheme();
              },
            ),
          ),
          ListTile(
            title: const Text("Logout"),
            trailing: IconButton(
              onPressed: () {
                onBoardControllerSignUp.logout(context);
              },
              icon: const Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
 
}
