import 'package:flutter/foundation.dart';
import 'package:smsrly/main.dart';
import '../models/user.dart';

class AppViewModel with ChangeNotifier{
  User? currUser;

  void setSeenOnBoarding() {
    prefs?.setString('has Entered The App before','1');
  }

  bool hasSeenOnBoarding(){
    return prefs?.getString('has Entered The App before') != null;
  }

}