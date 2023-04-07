import 'package:smsrly/res/strings.dart';

import '../../../repository/repository.dart';

class VerificationUseCase{
  Repository repository;
  VerificationUseCase(this.repository);

  Future<String> sendVerificationCode(
      String email,
      String code
      ) async {

    if(!_isValidData(code)){
      return StringManager.codeInvalid;
    }
    return await repository.checkVerificationCode(email, code);

  }

  bool _isValidData(
      String code
      ){
    if(code.length != 4){
      return false;
    }
    return true;
  }
}