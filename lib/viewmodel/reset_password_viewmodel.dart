import 'package:flutter/cupertino.dart';
import 'package:smsrly/main.dart';
import 'package:smsrly/models/validator.dart';
import 'package:smsrly/ui/authentication_screens/reset_password/forget_password_view.dart';
import 'package:smsrly/ui/authentication_screens/reset_password/verify_reset_password_code.dart';
import 'package:smsrly/utils/utils.dart';

import '../res/strings.dart';
import '../ui/authentication_screens/reset_password/reset_password_view.dart';

class ResetPasswordViewModel with ChangeNotifier {
  final ValidationService _validationService = ValidationService();

  TextEditingController _email = TextEditingController();

  TextEditingController get email {
    return _email;
  }

  List<TextEditingController> code = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  var isLoading = false;

  var _currWidget = 0;

  TextEditingController? _passwordController;
  bool isPasswordVisible = false;

  void togglePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  TextEditingController get passController {
    return _passwordController!;
  }

  TextEditingController? _confirmPasswordController;
  bool isConfirmPasswordVisible = false;

  void toggleConfirmPass() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  TextEditingController get confirmPassController {
    return _confirmPasswordController!;
  }

  String? token;

  void next({Function? onFinish}) async {
    isLoading = true;
    notifyListeners();
    if (_currWidget == 0) {

      print('bool => ${!_validationService.isValidEmail(_email.text)}');
      if (!_validationService.isValidEmail(_email.text)) {
        Utils.showToast(StringManager.emailNotValid, 1);
      }
      final res = await userRepository!.sendResetPasswordCodeRequest(_email.text);
      if (res == StringManager.successResetCodeMessage) {
        _currWidget = 1;
      } else {
        Utils.showToast(res, 1);
      }

    } else if (_currWidget == 1) {

      String codeNum = "";
      for (var element in code) {
        codeNum += element.text;
      }

      if (!_validationService.isValidCode(codeNum)) {
        Utils.showToast(StringManager.codeInvalid, 0);
      } else {
        final res =
        await userRepository!.checkResetPasswordCode(_email.text, codeNum);
        if (res is Map<String, dynamic> &&
            res['statue'] == StringManager.success) {
          token = res['token'];
          _currWidget = 2;
        } else {
          Utils.showToast(res, 1);
        }
      }
    } else if (_currWidget == 2) {
      if(!_validationService.isValidPassword(_passwordController!.text)
          || !_validationService.isValidPassword(_confirmPasswordController!.text)

      ){
        Utils.showToast(
            StringManager.passwordValidationMessage,
            1
        );
        isLoading = false;
        notifyListeners();
        return;
      }
      if(_passwordController!.text != _confirmPasswordController!.text){
        Utils.showToast(
            StringManager.checkPassword,
            1
        );
        isLoading = false;
        notifyListeners();
        return;
      }
      final res = await userRepository!.resetPassword(token!, _passwordController!.text);
      if(res == StringManager.passwordUpdated){
        if (onFinish != null) {
          onFinish();
        }
      }else{
        Utils.showToast(
            res,
            1
        );
        isLoading = false;
        notifyListeners();
        return;
      }

    }
    isLoading = false;
    notifyListeners();
  }

  void back() {
    _email.text = "";
    for (var i = 0; i < code.length; i++) {
      code[i].text = "";
    }
    _currWidget--;
    notifyListeners();
  }

  Widget? getCurrentWidget() {
    switch (_currWidget) {
      case 0:
        return const ForgetPasswordView();
      case 1:
        return const VerifyResetPasswordCodeView();
      case 2:
        return const ResetPasswordView();
    }
    return null;
  }

  void initPass() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }
}
