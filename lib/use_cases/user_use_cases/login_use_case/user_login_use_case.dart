import 'package:smsrly/services/auth_service.dart';

import '../../../models/user.dart';
import '../../../res/strings.dart';

class LoginUseCase {
  final AuthService authService;

  LoginUseCase(this.authService);

  Future<User?> signInUsingEmailAndPassword(
      String email, String password, Function(String msg) onFail) async {

    final res = _isValidData(email, password);

    if (res == StringManager.success) {
      final user = await authService.signInUsingEmailAndPassword(email, password);
      if(user != null){
        return user;
      }else{
        onFail(StringManager.loginFailed);
      }
    } else {
      onFail(res);
    }
    return null;
  }

  String _isValidData(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return StringManager.fieldsCannotBeEmpty;
    }
    final emailRegax = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegax.hasMatch(email)) {
      return StringManager.noUserFoundForThisEmail;
    }
    return StringManager.success;
  }
}
