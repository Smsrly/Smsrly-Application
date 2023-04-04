import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  late SharedPreferences _sharedPreferences;

  Future initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }


  Future setSeenOnBoarding()async{
    _sharedPreferences.setString('has Entered The App before','1');
  }
  bool hasSeenOnBoarding() {
    return _sharedPreferences.getString('has Entered The App before') != null;
  }

  Future saveToken(String token)async{
    _sharedPreferences.setString('token',token);
  }
  String? getToken() {
    return _sharedPreferences.getString('token');
  }
}
