import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smsrly/domain/repository/user_repository.dart';
import 'package:smsrly/domain/use_cases/user_use_cases/login_use_case/user_login_use_case.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/utils.dart';

class LoginViewModel with ChangeNotifier {
  UserRepository userRepository;
  late LoginUseCase _loginUseCase;
  LoginViewModel(this.userRepository){
    _loginUseCase = LoginUseCase(userRepository);
  }

  final _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> logIn() => _googleSignIn.signIn();

  Future logout() => _googleSignIn.disconnect();

  bool isPasswordVisible = false;

  void togglePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool _isLoading = false;

  get isLoading => _isLoading;

  void loginUser(String email, String password, Function onSuccess) async {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners();
      final res =
          await _loginUseCase.signInUsingEmailAndPassword(email, password);
      if (res == StringManager.success) {
        onSuccess();
      } else {
        Utils.showToast(res, 1);
      }
      _isLoading = false;
      notifyListeners();
    }
  }

  void loginWithGoogle(Function() onSuccess) async {
    final userDetails = await logIn();

    if (userDetails != null) {
      final res = await _loginUseCase.signInUsingGoogle(
          userDetails.displayName, userDetails.email, userDetails.photoUrl);
      if (res == StringManager.success) {
        onSuccess();
      } else {
        Utils.showToast(res, 1);
      }
    } else {
      Utils.showToast(StringManager.tryAgain, 1);
    }
  }
}
