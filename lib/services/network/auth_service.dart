import 'package:smsrly/models/user.dart';
import 'package:smsrly/services/network/api_services.dart';

class AuthService{

  late ApiServices _apiServices;

  AuthService(){
    _apiServices = ApiServices();
  }
  Future<dynamic> signInUsingEmailAndPassword(String email,String password) async {
    return await _apiServices.getSignInResponse(email, password);
  }

  Future signUp(User user,String password,Function(String) onFail) async {

  }


}