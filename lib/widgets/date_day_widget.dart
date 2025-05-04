import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateDayWidget extends StatelessWidget {
  const DateDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(30, (index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15, right: 8),
            child: Container(
                height: 108,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: index==0?Colors.black:Color(0xFFE8E4FF),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFE8E4FF),
                ),
                alignment: Alignment.center,
                child: index == 0
                    ? Text(
                  "1\nFri",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                )
                    : index == 1
                    ? Text(
                  "2\nSat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                )
                    : index == 2
                    ? Text(
                  "3\nSun",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                )
                    : index == 3
                    ? Text(
                  "4\nMon",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==4? Text(
                  "5\nTue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==5? Text(
                  "6\nWed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==6? Text(
                  "7\nThu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==7? Text(
                  "8\nFri",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==8? Text(
                  "9\nSat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==9? Text(
                  "10\nSun",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==10? Text(
                  "11\nMon",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==11? Text(
                  "12\nTue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==12? Text(
                  "13\nWed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==13? Text(
                  "14\nThu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==14? Text(
                  "15\nFri",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==15? Text(
                  "16\nSat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==16? Text(
                  "17\nSun",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==17? Text(
                  "18\nMon",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==18? Text(
                  "19\nTue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==19? Text(
                  "20\nWed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==20? Text(
                  "21\nThu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==21? Text(
                  "22\nFri",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==22? Text(
                  "23\nSat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==23? Text(
                  "24\nSun",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==24? Text(
                  "25\nMon",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==25? Text(
                  "26\nTue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==26? Text(
                  "27\nWed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==27? Text(
                  "28\nThu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):index==28? Text(
                  "29\nFri",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ):Text(
                  "30\nSat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                )
            ),
          );
        }),
      ),
    );
  }
}