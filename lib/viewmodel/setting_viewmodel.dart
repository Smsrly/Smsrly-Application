import 'package:flutter/foundation.dart';
import 'package:smsrly/domain/repository/user_repository.dart';
import 'package:smsrly/domain/use_cases/user_use_cases/change_password/change_password_use_case.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/utils.dart';

class SettingViewModel with ChangeNotifier{
  UserRepository userRepository;
  late ChangePasswordUseCase _changePasswordUseCase;

  SettingViewModel(this.userRepository){
    _changePasswordUseCase = ChangePasswordUseCase(userRepository);
  }

  bool isNewPasswordVisible = false;
  void toggleNewPassword(){
    isNewPasswordVisible = !isNewPasswordVisible;
    notifyListeners();
  }
  bool isConfirmPasswordVisible = false;
  void toggleConfirmPassword(){
    isConfirmPasswordVisible = !isConfirmPasswordVisible ;
    notifyListeners();
  }
  bool isLoading = false;


  void changePassword(String newPassword, String confirmPassword, VoidCallback onSuccess)async{
    isLoading = true;
    notifyListeners();
    final res = await _changePasswordUseCase.update(newPassword, confirmPassword);
    if(res == StringManager.passwordUpdated){
      Utils.showToast(StringManager.passwordUpdated, 1);
      onSuccess();
    }else{
      Utils.showToast(res, 1);
    }
    isLoading = false;
    notifyListeners();
  }
}