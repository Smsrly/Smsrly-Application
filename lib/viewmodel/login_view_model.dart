import 'package:flutter/foundation.dart';
import 'package:smsrly/domain/use_cases/user_use_cases/login_use_case/user_login_use_case.dart';
import 'package:smsrly/main.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/utils.dart';

import '../data/network/auth_service.dart';

class LoginViewModel with ChangeNotifier {

  bool isPasswordVisible = false;

  void togglePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool _isLoading = false;

  get isLoading => _isLoading;

  void loginUser(String email, String password, Function onSuccess) async {
    if(!_isLoading){
      _isLoading = true;
      notifyListeners();
      LoginUseCase loginUseCase = LoginUseCase(repository!);
      final res = await loginUseCase.signInUsingEmailAndPassword(email, password);
      if(res == StringManager.success){
        onSuccess();
      }else{
        Utils.showToast(res, 1);
      }
      _isLoading = false;
      notifyListeners();
    }
  }
}
