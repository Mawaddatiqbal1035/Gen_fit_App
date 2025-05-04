
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen_fit/features/authentication/presentation/screens/signup_screen.dart';

import '../core/utils/app_constants/app_assets/app_assets.dart';
import '../core/utils/app_constants/texts/app_authentication_texts_expanded.dart';

class OnBoardScreen2 extends StatefulWidget {

  const OnBoardScreen2({super.key});

  @override
  State<OnBoardScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<OnBoardScreen2> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFEEECEC),
          body: SingleChildScrollView(
              child: Center(
                  child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(
                                  style: DefaultTextStyle.of(context).style.copyWith(
                                  ),
                                  children:[
                                    TextSpan(
                                        text: AppAuthenticationTextsExpanded.daily,
                                        style: TextStyle(
                                            fontSize: s.width*0.020+s.height*0.020,
                                           color:  const Color(0xFF9F7EFE),
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    TextSpan(
                                        text:AppAuthenticationTextsExpanded.fitPlanner,
                                        style: TextStyle(
                                          fontSize: s.width*0.020+s.height*0.020,
                                          color: Colors.black,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                        )
                                    )
                                  ]
                              ))
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Correct usage of SvgPicture
                          SvgPicture.asset(
                            AppAssets.onBoardScreenAsset2,
                            height: s.height*0.250+s.width*0.200, // Adjust to fit screen
                            fit: BoxFit.contain,
                            theme: SvgTheme(
                              fontSize: s.height*20+s.width*0.20,
                            ),
                          ),
                          const SizedBox(height: 2),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              shadowColor: Colors.grey,
      
                              elevation: 4.5,
                            ).copyWith(
                                fixedSize: MaterialStateProperty.all(Size(s.width*0.18,s.height*0.18),),
                              iconColor: WidgetStatePropertyAll(Colors.black)
                            ),
                            onPressed: () {
                              // Define button action here
                            },
                            child: Center(child: const Icon(Icons.arrow_forward_outlined, size: 30)),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: s.width * 0.15),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(25),
                              color:  const Color(0xFF9F7EFE),
                              minHeight: 13,
                              value: 0.6,
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Stack(
                              children: [ Flexible(
                                  child:Transform.rotate(angle: 3.14/-20,
                                    child: Container(
                                      height: s.height*0.16,
                                      width: s.width*0.50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(2060),
                                              topRight: Radius.circular(1150),
                                              bottomLeft: Radius.circular(1000),
                                              bottomRight: Radius.circular(1050)
                                          )
      
      
                                      ),
                                    ),) ),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style.copyWith(fontSize: 28),
                                    children: [
                                      TextSpan(
                                        text: AppAuthenticationTextsExpanded.findYour,
                                        style: TextStyle(
                                          fontSize: s.width*0.025+s.height*0.025,
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
                                        text: AppAuthenticationTextsExpanded.workout,
                                        style: TextStyle(
                                          fontSize: s.width*0.023+s.height*0.023,
                                          color:  const Color(0xFF9F7EFE),
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
                                        text: AppAuthenticationTextsExpanded.fromDifferentPrograms,
                                        style: TextStyle(
                                          fontSize: s.width*0.015+s.height*0.015,
                                          color: Colors.black,
                                          fontStyle: FontStyle.italic,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.grey.withOpacity(0.5),
                                              offset: const Offset(3.0, 3.0),
                                            ),],
                                        ),
                                      ),
      
                                    ],
                                  ),
                                ),
                              ]),
      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ElevatedButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));},
                                  style:Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                    fixedSize: MaterialStateProperty.all(
                                  Size(s.width*0.22, s.height*0.010))
                                  ), child: Text(AppAuthenticationTextsExpanded.skip,
                                  style: Theme.of(context).textTheme.bodySmall?.
                                  copyWith(fontWeight: FontWeight.bold)),
                                                          ),
                                ),
                              ],
                            )
      
                          ])))),
    );
  }
}