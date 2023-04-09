
import '../../../../models/validator.dart';
import '../../../../res/strings.dart';
import '../../../repository/repository.dart';


class LoginUseCase {
  Repository repository;
  late ValidationService _validationService;
  LoginUseCase(this.repository){
    _validationService = ValidationService();
  }

  Future<String> signInUsingEmailAndPassword(
      String email, String password) async {

    final res = _isValidData(email, password);
    if(res != StringManager.success){
      return res;
    }

    return await repository.signInWithEmailAndPassword(email, password);
  }

  String _isValidData(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return StringManager.fieldsCannotBeEmpty;
    }
    if(!_validationService.isValidPassword(password)){
      return StringManager.incorrectPass;
    }
    if (!_validationService.isValidEmail(email)) {
      return StringManager.noUserFoundForThisEmail;
    }
    return StringManager.success;
  }
}
