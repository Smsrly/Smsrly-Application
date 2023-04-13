import 'package:flutter/foundation.dart';
import 'package:smsrly/domain/use_cases/user_use_cases/get_user_data/get_user_data_use_case.dart';
import 'package:smsrly/main.dart';
import '../models/user.dart';
import '../utils/routes/route_name.dart';

class AppViewModel with ChangeNotifier {
  User? currUser;
  bool isLoading = false;

  Future getUser({required VoidCallback onFail}) async {

  }

  void setSeenOnBoarding() async {
    userRepository?.setSeenOnBoarding();
  }

  bool hasSeenOnBoarding() {
    return userRepository!.hasSeenOnBoarding();
  }

  bool hasUserSignedInBefore() {
    return userRepository!.hasUserSignedInBefore();
  }

  String getStartScreen() {
    print('getStartScreen');
    if (hasUserSignedInBefore()) {
      return RouteName.splashRoute;
    } else if (hasSeenOnBoarding()) {
      return RouteName.loginRoute;
    } else {
      return RouteName.onBoardingRoute;
    }
  }
}
