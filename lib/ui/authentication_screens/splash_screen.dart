import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/utils/routes/route_name.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

import '../../res/strings.dart';
import '../../utils/utils.dart';
import '../../viewmodel/splash_view_model.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _disposed = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _controller=AnimationController(vsync: this,duration: const Duration(seconds: 5));
    final provider = Provider.of<SplashViewModel>(context,listen: false);
    Future.delayed(const Duration(seconds: 5),(){
      provider.onStart().then((_) {
        if(_){
          Provider.of<AppViewModel>(context,listen: false).currUser = provider.user;
          if(!_disposed){
            _controller.dispose();
            _disposed = true;
          }
          print('hello');
          Navigator.of(context).pushReplacementNamed(RouteName.screensContainerRoute);
        }else{
          print('hello1');
          Navigator.of(context).pushReplacementNamed(RouteName.loginRoute);
        }
      });
    });

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          StringManager.splashAnimation,
            animate: true,
            repeat: false,
            controller: _controller, onLoaded: (comp) async {
          _controller.forward();
        }),
      ),
    );
  }
}

