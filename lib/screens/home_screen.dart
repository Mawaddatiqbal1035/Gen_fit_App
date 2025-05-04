
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gen_fit/controllers/onboard_Controller.dart';
import 'package:get/get.dart';
import '../core/shared_features/theme_management/presentation/controllers/theme_controller.dart';
import '../widgets/daily_workout_widget.dart';
import '../widgets/date_day_widget.dart';

class HomeScreen extends StatelessWidget {
  //final Function callBack;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final themeController=Get.find<ThemeController>();
    final onBoardController=Get.put(OnBoardController());

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("Home",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: s.width * 0.03 + s.height * 0.020,
              )),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(onPressed: (){
                  onBoardController.logOut();
                }, icon: Icon(Icons.logout)),
                IconButton(onPressed: (){
                  themeController.changeTheme(
                      Theme.of(context).brightness==Brightness.light? ThemeMode.dark:
                      Theme.of(context).brightness==Brightness.dark?ThemeMode.light:ThemeMode.system);
                }, icon: Icon(Icons.dark_mode),style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black),
                    backgroundColor:WidgetStatePropertyAll(Colors.white) ),),
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: CircleAvatar(
                   child: Icon(Icons.person),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Workouts",
                      style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: s.width * 0.03 + s.height * 0.020,
                      )
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Container(
                          height: s.height * 0.064,
                          width: s.width * 0.99,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFD9D9D9),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Recommended", style: Theme.of(context).textTheme.bodySmall),
                                      style: ButtonStyle(
                                        fixedSize:   MaterialStateProperty.all(Size(s.width*0.38,s.height*0.027)),
                                        backgroundColor: MaterialStateProperty.all(Color(0xFFE8E4FF)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Top Workouts", style: Theme.of(context).textTheme.bodySmall),
                                      style: ButtonStyle(
                                        fixedSize:   MaterialStateProperty.all(Size(s.width*0.36,s.height*0.027)),
                                        backgroundColor: MaterialStateProperty.all(Color(0xFFE8E4FF)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("My Routine", style: Theme.of(context).textTheme.bodySmall),
                                      style: ButtonStyle(
                                        fixedSize:   MaterialStateProperty.all(Size(s.width*0.32,s.height*0.027)),
                                        backgroundColor: MaterialStateProperty.all(Color(0xFFE8E4FF)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 15),
                      const DateDayWidget(),
                      SizedBox(height: 10),
                      DailyWorkoutWidget(),
                    ],
                  ),
                );
              }, childCount: 1),
            ),
          ],
        ),
      ),
    );
  }
}



