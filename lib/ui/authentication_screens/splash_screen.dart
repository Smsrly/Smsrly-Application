import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smsrly/controller/controller.dart';


class SplashScreen extends GetWidget<Controller> {

  static const  String route = "/SPLASH_SCREEN";

  SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
      body: Center(
        child:Lottie.asset(
            "assets/animations/loading_home_animation.json",
            animate: true,
            repeat: false,
        ) ,
      ),
    );
  }
}
