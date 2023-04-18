import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/ui/widgets/others/d_progress_bar.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/utils/routes/route_name.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

import '../../res/strings.dart';
import '../../viewmodel/splash_view_model.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashViewModel>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
          future: provider.onStart(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return splashWidget();
            } else if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.data as bool){
                Future.delayed(const Duration(seconds: 2), () {
                  final appProvider = Provider.of<AppViewModel>(context, listen: false);
                  appProvider.currUser = provider.user;
                  appProvider.realEstateItems = provider.realEstateItems!;
                  appProvider.realEstateItemsMap = provider.realEstateItemsMap!;
                  context.pushReplacementNamed(RouteName.screensContainerRoute);
                });
              }else{
                Future.delayed(const Duration(seconds: 2), () {
                  context.pushReplacementNamed(RouteName.loginRoute);
                });
              }
            }
            return splashWidget();
          }
      ),
    );
  }


  Widget splashWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
            StringManager.pictureForLogin
        ),
        const DefaultProgressBar()
      ],
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