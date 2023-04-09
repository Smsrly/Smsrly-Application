import 'dart:io';

import 'package:smsrly/res/strings.dart';

import '../../models/user.dart';
import 'api_services.dart';

class AuthService {
  late ApiServices _apiServices;

  AuthService() {
    _apiServices = ApiServices();
  }

  Future<Map<dynamic, dynamic>> signInUsingEmailAndPassword(
      String email, String password) async {
    final ans = {};
    final res = await _apiServices.getSignInResponse(email, password);
    print('h2');
    print('res => $res');
    if (res is Map<String, dynamic>) {
      ans['statue'] = StringManager.success;
      ans['message'] = res['message'];
      ans['token'] = res['token'];
      return ans;
    }
    ans['statue'] = StringManager.fail;
    ans['result'] = res;
    return ans;
  }

  Future<Map<dynamic, dynamic>> signUp(
      User user, String password, File? file) async {
    final ans = {};
    final res = await _apiServices.signUpResponse(user, password);
    if (res is Map<String, dynamic>) {
      if (file != null) {
        await _apiServices.uploadUserImage(user.email, file);
      }

      ans['statue'] = StringManager.success;
      ans['message'] = res['message'];
      return ans;
    } else {
      ans['statue'] = StringManager.fail;
      ans['result'] = res;
      return res;
    }
  }

  Future<Map<dynamic, dynamic>> checkVerifyCode(
      String email, String code) async {
    final res = await _apiServices.verifyCode(email, code);
    var result = {};
    if (res is Map<String, dynamic>) {
      if (res['message'] == 'activated') {
        result['statue'] = StringManager.success;
        result['token'] = res['token'];
        result['message'] = res['message'];
        return result;
      } else {
        result['statue'] = StringManager.fail;
        result['message'] = res['message'];
        return result;
      }
    }
    result['statue'] = StringManager.fail;
    result['result'] = res;
    return result;
  }


  Future<Map<String,dynamic>> sendResetCodeRequest(String email)async{
    final res = await _apiServices.sendResetCodeRequest(email);
    Map<String,dynamic> sub ={};
    if(res is Map<String,dynamic>){
      sub['statue'] = StringManager.success;
      sub['message'] = res['message'];
      return sub;
    }
    sub['statue'] = StringManager.fail;
    sub['result'] = res;
    return sub;
  }
}
