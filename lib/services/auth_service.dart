import 'package:smsrly/models/user.dart';

class AuthService{

  Future<User?> signInUsingEmailAndPassword(String email,String password)async{
    await Future.delayed(const Duration(seconds: 2));
    return User("asd", "asd", email, "asd", 32.2, 32.1, "https://www.thefamouspeople.com/profiles/images/francesco-totti-1.jpg");
  }

  Future signUp(User user,String password,Function(String) onFail) async {

  }


}