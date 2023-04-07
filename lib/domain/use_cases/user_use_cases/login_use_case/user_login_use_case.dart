
import '../../../../res/strings.dart';
import '../../../repository/repository.dart';


class LoginUseCase {
  Repository repository;
  LoginUseCase(this.repository);

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
    if(password.length < 8){
      return StringManager.incorrectPass;
    }
    final emailRegax = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegax.hasMatch(email)) {
      return StringManager.noUserFoundForThisEmail;
    }
    return StringManager.success;
  }
}
