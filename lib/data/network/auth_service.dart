import 'dart:io';

import 'package:smsrly/res/strings.dart';

import '../../models/user.dart';
import 'api_services.dart';

class AuthService{

  late ApiServices _apiServices;

  AuthService(){
    _apiServices = ApiServices();
  }

  Future<Map<dynamic,dynamic>> signInUsingEmailAndPassword(String email,String password) async {
    final ans = {};
    final res = await _apiServices.getSignInResponse(email, password);
    print('h2');
    print('res => $res');
    if(res is Map<String,dynamic>){
      ans['statue'] = StringManager.success;
      ans['message'] = res['message'];
      ans['token'] = res['token'];
      return ans;
    }
    ans['statue'] = StringManager.fail;
    ans['result'] = res;
    return ans;
  }

  Future<Map<dynamic,dynamic>> signUp(User user, String password,File? file) async {
    final ans = {};
    final res = await _apiServices.signUpResponse(user,password);
    if(res is Map<String,dynamic>){
      if(file != null){
        final imageRes = await _apiServices.uploadUserImage(user.email, file);
      }

      ans['statue'] = StringManager.success;
      ans['message'] = res['message'];
      return ans;
    }else{
      ans['statue'] = StringManager.fail;
      ans['result'] = res;
      return res;
    }


  }


}