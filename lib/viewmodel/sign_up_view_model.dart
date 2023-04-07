import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smsrly/domain/use_cases/user_use_cases/sign_up_use_case/user_signup_use_case.dart';
import 'package:smsrly/main.dart';
import 'package:smsrly/utils/utils.dart';

import '../res/strings.dart';

class SignUpViewModel with ChangeNotifier {
  SignUpUseCase? _signUpUseCase;
  PickedFile? _image;

  PickedFile get image {
    return _image!;
  }

  var isPasswordVisible = false;

  void togglePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  var isConfirmPasswordVisible = false;

  void toggleConfirmPassword() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  CountryCode? _countryCode;

  CountryCode? get countryCode => _countryCode;

  void changeCountryCode(CountryCode code) {
    _countryCode = code;
    notifyListeners();
  }

  void changeImage(PickedFile pickedFile) {
    _image = pickedFile;
    notifyListeners();
  }

  bool hasNoImage() {
    return _image == null;
  }

  Future signUp(String firstName, String secondName, String email,
      String phoneNumber, String password, String confirmPassword) async {
    _signUpUseCase ??= SignUpUseCase(repository!);
    if(_countryCode!= null){
      print(_countryCode!.dialCode);
      phoneNumber = "${_countryCode!.dialCode}$phoneNumber";
    }else{
      phoneNumber = "+20$phoneNumber";
    }
    String res = await _signUpUseCase!.signUp(firstName, secondName, email, phoneNumber, password, confirmPassword);
    if(res!=StringManager.success){
      Utils.showToast(res, 1);
    }
    /*
    signUpUseCase ??= SignUpUseCase(_authService);
    final s = signUpUseCase?.isValidData(firstName, secondName, email, phoneNumber, password, confirmPassword);
    if(s!=StringManager.success){
      Utils.showToast(
          s!, 1
      );
    }

     */
  }
}
