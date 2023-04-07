import 'dart:io';

import 'package:smsrly/data/network/api_constants.dart';
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

  Future signUp(User user, File? file) async {
    if(file != null){
      _apiServices.uploadImage(ApiConstants.baseUrl + ApiConstants.registerEndPoint, file);
    }

  }


}