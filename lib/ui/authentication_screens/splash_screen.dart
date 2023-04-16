import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/utils/routes/route_name.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

import '../../res/strings.dart';
import '../../viewmodel/splash_view_model.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashViewModel>(context,listen: false);
    return Scaffold(
      body: FutureBuilder(
          future: provider.getData(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return splashWidget();
            }else{
              final appProvider = Provider.of<AppViewModel>(context,listen: false);
              appProvider.currUser = provider.user;
              appProvider.realEstateItems = provider.realEstateItems!;
              Navigator.of(context).pushReplacementNamed(RouteName.screensContainerRoute);
            }
            return splashWidget();
          }
      ),
    );
  }

  Widget splashWidget(){
    return Center(
      child: Lottie.asset(
          StringManager.splashAnimation,
          animate: true,
          repeat: false,
      )
    );
  }

  void onStart(){
    // _controller = AnimationController(vsync: this,duration: const Duration(seconds: 5));
    // final provider = Provider.of<SplashViewModel>(context,listen: false);
    // _operation = CancelableOperation.fromFuture(provider.onStart().then((_) {
    //   if(_){
    //     final appProvider = Provider.of<AppViewModel>(context,listen: false);
    //     appProvider.currUser = provider.user;
    //     appProvider.realEstateItems = provider.realEstateItems!;
    //     Navigator.of(context).pushReplacementNamed(RouteName.screensContainerRoute);
    //   }else{
    //     Navigator.of(context).pushReplacementNamed(RouteName.loginRoute);
    //   }
    // }));
  }
}