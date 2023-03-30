import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../res/strings.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        StringManager.splashAnimation,
        animate: true,
        repeat: false,
      ),
    );
  }
}
