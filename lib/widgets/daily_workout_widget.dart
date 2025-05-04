import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/utils/app_constants/app_assets/app_assets.dart';
import '../core/utils/app_constants/texts/app_authentication_texts_expanded.dart';

class DailyWorkoutWidget extends StatelessWidget {
  const DailyWorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: index==0?Container(
              width: s.width * 0.96,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Color(0xFFE5E2ED),
              ),
              child: Row(
                children: [
                  // Image on the left
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      AppAssets.homeScreenWorkoutAsset1,
                      height: s.height * 0.16,
                      fit: BoxFit.contain,
                      width: s.width * 0.010,
                    ),
                  ),
                  // Text and "45 Mins" aligned in the same row
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppAuthenticationTextsExpanded.morningBikeRIde,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: s.width * 0.020 + s.height * 0.020,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 15.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppAuthenticationTextsExpanded.fourtyFivemins,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: s.width * 0.008 + s.height * 0.008,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):index==1?Container(
              width: s.width * 0.96,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Color(0xFFE5E2ED),
              ),
              child: Row(
                children: [
                  // Image on the left
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      AppAssets.homeScreenWorkoutAsset2,
                      height: s.height * 0.15,
                      fit: BoxFit.contain,
                      width: s.width * 0.010,
                    ),
                  ),
                  // Text and "45 Mins" aligned in the same row
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppAuthenticationTextsExpanded.eneningWorkout,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: s.width * 0.020 + s.height * 0.020,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 15.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppAuthenticationTextsExpanded.sixtymins,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: s.width * 0.008 + s.height * 0.008,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):Container(
              width: s.width * 0.96,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Color(0xFFE5E2ED),
              ),
              child: Row(
                children: [
                  // Image on the left
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                     AppAssets.homeScreenWorkoutAsset3,
                      height: s.height * 0.15,
                      fit: BoxFit.contain,
                      width: s.width * 0.010,
                    ),
                  ),
                  // Text and "45 Mins" aligned in the same row
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           AppAuthenticationTextsExpanded.nightScrethchec,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: s.width * 0.020 + s.height * 0.020,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 15.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                      AppAuthenticationTextsExpanded.thirthymins,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: s.width * 0.008 + s.height * 0.008,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}