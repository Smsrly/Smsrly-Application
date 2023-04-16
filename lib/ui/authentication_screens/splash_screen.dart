import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/utils/routes/route_name.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

import '../../res/strings.dart';
import '../../viewmodel/splash_view_model.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _disposed = false;
  late CancelableOperation _operation;

  @override
  void initState() {
    super.initState();
    onStart();
  }
  void onStart(){
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 5));
    final provider = Provider.of<SplashViewModel>(context,listen: false);
    _operation = CancelableOperation.fromFuture(provider.onStart().then((_) {
      if(_){
        final appProvider = Provider.of<AppViewModel>(context,listen: false);
        appProvider.currUser = provider.user;
        appProvider.realEstateItems = provider.realEstateItems!;
        Navigator.of(context).pushReplacementNamed(RouteName.screensContainerRoute);
      }else{
        Navigator.of(context).pushReplacementNamed(RouteName.loginRoute);
      }
    }));
  }

  @override
  void dispose() {
    if(!_disposed){
      _controller.dispose();
    }
    _disposed = true;
    _operation.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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