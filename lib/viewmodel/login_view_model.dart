import 'package:flutter/foundation.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/services/network/auth_service.dart';
import 'package:smsrly/use_cases/user_use_cases/login_use_case/user_login_use_case.dart';
import 'package:smsrly/utils/utils.dart';

class LoginViewModel with ChangeNotifier {
  late User user;
  AuthService authService = AuthService();

  bool isPasswordVisible = false;

  void togglePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool _isLoading = false;

  get isLoading => _isLoading;

  Future loginUser(String email, String password, Function onSuccess) async {
    _isLoading = true;
    notifyListeners();
    LoginUseCase loginUseCase = LoginUseCase(authService);

    final user = await loginUseCase.signInUsingEmailAndPassword(
        email, password, (msg) => Utils.showToast(msg, 1));
    if (user != null) {
      this.user = user;
      onSuccess();
    }
    _isLoading = false;
    notifyListeners();
  }
}
