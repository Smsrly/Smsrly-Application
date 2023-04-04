import 'package:flutter/foundation.dart';
import 'package:smsrly/main.dart';
import '../models/user.dart';
import '../utils/routes/route_name.dart';

class AppViewModel with ChangeNotifier{
  User? currUser;

  void setSeenOnBoarding() async {
    localService!.setSeenOnBoarding();
  }

  bool hasSeenOnBoarding(){
    return localService!.hasSeenOnBoarding();
  }

  bool hasUserSignedInBefore(){
    return localService!.getToken() != null;
  }

  String getStartScreen(){
    if(hasUserSignedInBefore()){
      return RouteName.screensContainerRoute;
    } else if(hasSeenOnBoarding()){
      return RouteName.loginRoute;
    }else{
      return RouteName.onBoardingRoute;
    }
  }
}