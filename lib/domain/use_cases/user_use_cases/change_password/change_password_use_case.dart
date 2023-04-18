import 'package:smsrly/domain/repository/user_repository.dart';
import 'package:smsrly/res/strings.dart';

import '../../../../models/validator.dart';

class ChangePasswordUseCase{
  UserRepository userRepository;
  late ValidationService _validationService;
  ChangePasswordUseCase(this.userRepository){
    _validationService = ValidationService();
  }

  Future update(String pass,String confPass)async{
    if(_isValidData(pass, confPass)){
      final res = await userRepository.changePassword(pass);
      return res;
    } else {
      return StringManager.checkPassword;
    }
  }

  bool _isValidData(String pass,String confPass){
    return pass == confPass && _validationService.isValidPassword(pass);
  }
}