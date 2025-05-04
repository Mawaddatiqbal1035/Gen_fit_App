import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../core/utils/app_constants/colors/app_colors.dart';

class VerificationScreenWidget extends StatelessWidget {
  final String verificationId;

  VerificationScreenWidget({required this.verificationId});

  final OtpTextField otpController = OtpTextField();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 170,top: 10),
              child: Text("Please Check your Email\n",style: TextStyle(fontWeight: FontWeight.bold,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 80),
              child: Text("We have sent the code to $verificationId"),
            ),
            OtpTextField(clearText: true,),
            SizedBox(height: 10,),
          Text("Send Code again $Timer"),
            SizedBox(height: 120),
            ElevatedButton(
              onPressed: () {},
              child: Text("Verification"),
            ),
          ],
        ),
      );
  }


}
