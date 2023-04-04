import 'package:smsrly/models/user.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/services/network/api_services.dart';

class AuthService{

  late ApiServices _apiServices;

  AuthService(){
    _apiServices = ApiServices();
  }
  Future<Map<dynamic,dynamic>> signInUsingEmailAndPassword(String email,String password) async {
    final ans = {};
    final res = await _apiServices.getSignInResponse(email, password);
    print('h2');
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

  Future signUp(User user,String password,Function(String) onFail) async {

  }


}