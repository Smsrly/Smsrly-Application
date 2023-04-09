import 'package:flutter/cupertino.dart';
import 'package:smsrly/main.dart';
import 'package:smsrly/models/validator.dart';
import 'package:smsrly/ui/authentication_screens/reset_password/forget_password_view.dart';
import 'package:smsrly/ui/authentication_screens/reset_password/verify_reset_password_code.dart';
import 'package:smsrly/utils/utils.dart';

import '../res/strings.dart';
import '../ui/authentication_screens/reset_password/reset_password_view.dart';

class ResetPasswordViewModel with ChangeNotifier{

  TextEditingController _email = TextEditingController();
  TextEditingController get email{
    return _email;
  }

  List<TextEditingController> code = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()];

  var isLoading = false;

  final ValidationService _validationService = ValidationService();
  var _currWidget = 0;


  void next() async {
    isLoading = true;
    notifyListeners();
    if(_currWidget == 0){
      print('bool => ${!_validationService.isValidEmail(_email.text)}');
      if(!_validationService.isValidEmail(_email.text)){
        Utils.showToast(StringManager.emailNotValid, 1);
        isLoading = false;
        notifyListeners();
        return;
      }
      final res = await repository!.sendResetPasswordCodeRequest(_email.text);
      if(res == StringManager.successResetCodeMessage){
        _currWidget = 1;
      } else {
        Utils.showToast(res, 1);
        isLoading = false;
        notifyListeners();
        return;
      }
    } else if (_currWidget == 1) {

    }
    isLoading = false;
    notifyListeners();

  }
  void back(){
    _email.text = "";
    for(var i=0; i<code.length; i++){
      code[i].text = "";
    }
    _currWidget--;
    notifyListeners();
  }
  Widget? getCurrentWidget(){
    switch(_currWidget){
      case 0:
        return const ForgetPasswordView();
      case 1:
        return const VerifyResetPasswordCodeView();
      case 2:
        return const ResetPasswordView();
    }
    return null;
  }

}