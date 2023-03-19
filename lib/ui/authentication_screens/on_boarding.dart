import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smsrly/ui/authentication_screens/login.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/colors.dart';

import '../strings.dart';

class OnBoarding extends StatelessWidget {
  static const  String route = "/ON_BOARDING";
  const OnBoarding({super.key});

  Widget imageBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/onboarding_screen_background.png"),
            fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        imageBackground(),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: blackWithMediumOpacity,
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              SizedBox(
                  width: 400.w,
                  height: 400.h,
                  child: Image.asset("assets/images/onboarding_logo.png")),
              const Expanded(flex: 1, child: SizedBox()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                width: double.infinity,
                child: RoundedButton(
                  onClick: () {
                    Get.to(Login());
                  },
                  text: StringManeger.getStarted,
                ),
              ),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
        )
      ],
    ));
  }
}
