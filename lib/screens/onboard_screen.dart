import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen_fit/screens/onboard_screen2.dart';
import '../core/utils/app_constants/app_assets/app_assets.dart';
import '../core/utils/app_constants/texts/app_authentication_texts_expanded.dart';
import 'package:get/get.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEECEC),
        body: SingleChildScrollView(
          child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: AppAuthenticationTextsExpanded.daily,
                            style: TextStyle(
                              fontSize: s.width * 0.020 + s.height * 0.020,
                              color: const Color(0xFF9F7EFE),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: AppAuthenticationTextsExpanded.fitPlanner,
                            style: TextStyle(
                              fontSize: s.width * 0.020 + s.height * 0.020,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  SvgPicture.asset(AppAssets.onBoardScreenAsset1, height: s.height*0.250+s.width*0.200,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      shadowColor: Colors.grey,
                      elevation: 4.5,
                    ).copyWith(
                      fixedSize: MaterialStateProperty.all(Size(s.width * 0.18, s.height * 0.18)),
                      iconColor: const WidgetStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      // Navigate or perform action
                    },

                      child: const Icon(Icons.arrow_forward_outlined, size: 30),
                    ),


                  const SizedBox(height: 10),

                  // Progress Bar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: s.width * 0.15),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFF9F7EFE),
                      minHeight: 13,
                      value: 0.3,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Stack with background container + motivational text
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: 3.14 / 14,
                        child: Container(
                          height: s.height * 0.16,
                          width: s.width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(2060),
                              topRight: Radius.circular(1150),
                              bottomLeft: Radius.circular(1000),
                              bottomRight: Radius.circular(1050),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: AppAuthenticationTextsExpanded.push,
                                style: TextStyle(
                                  fontSize: s.width * 0.025 + s.height * 0.025,
                                  color: const Color(0xFF9F7EFE),
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: const Offset(3.0, 3.0),
                                    ),
                                  ],
                                ),
                              ),
                              TextSpan(
                                text: AppAuthenticationTextsExpanded.yourLimits,
                                style: TextStyle(
                                  fontSize: s.width * 0.023 + s.height * 0.023,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: const Offset(3.0, 3.0),
                                    ),
                                  ],
                                ),
                              ),
                              TextSpan(
                                text: AppAuthenticationTextsExpanded.recordYourPersonalBest,
                                style: TextStyle(
                                  fontSize: s.width * 0.015 + s.height * 0.015,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: const Offset(3.0, 3.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Skip Button (aligned right)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: s.width * 0.06),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OnBoardScreen2()));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(s.width * 0.22, s.height * 0.04),
                        ),
                        child: Text(
                          AppAuthenticationTextsExpanded.skip,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
