import 'package:smsrly/res/strings.dart';

import '../../../../models/validator.dart';
import '../../../repository/user_repository.dart';

class VerificationUseCase{
  UserRepository repository;
  late ValidationService _validationService;
  VerificationUseCase(this.repository){
    _validationService = ValidationService();
  }

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
    return _validationService.isValidCode(code);
  }
}