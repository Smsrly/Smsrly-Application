import 'package:flutter/foundation.dart';
import 'package:smsrly/main.dart';
import '../models/user.dart';
import '../utils/routes/route_name.dart';

class AppViewModel with ChangeNotifier{
  User? currUser;

  void setSeenOnBoarding() async {
    repository?.setSeenOnBoarding();
  }

  bool hasSeenOnBoarding(){
    return repository!.hasSeenOnBoarding();
  }

  bool hasUserSignedInBefore(){
    return repository!.hasUserSignedInBefore();
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