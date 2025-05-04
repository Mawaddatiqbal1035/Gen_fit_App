
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/onBoard_get_controller.dart';

class MyTextfieldWidget extends StatelessWidget {
  MyTextfieldWidget({super.key,required this.hintText,required this.title,required this.errorMessage,
    required this.controller,});

  final String? hintText;

  final String? title;

  final String? errorMessage;

  final TextEditingController  controller;



  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Obx(() {
      final onBoardGetController=Get.find<OnBoardGetController>();
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(title!, style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(
                fontSize: s.width * 0.016 + s.height * 0.02,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintStyle: TextStyle(
                  color: Theme
                      .of(context)
                      .hintColor,
                  fontSize: s.width * 0.014 + s.height * 0.012,
                ),
                hintText: hintText,

            ),
          ),
          if (onBoardGetController.isError.value == true)
            Text(errorMessage!),
        ],
      );
    } );
  }
}
