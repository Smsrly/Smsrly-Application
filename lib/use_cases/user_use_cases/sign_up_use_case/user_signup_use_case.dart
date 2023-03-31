import '../../../res/strings.dart';
import '../../../services/auth_service.dart';

class SignUpUseCase{
  final AuthService authService;

  SignUpUseCase(this.authService);


  Future signUp(
      String picture,
      String firstName,
      String secondName,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword,
      Function(String) onFail
      ) async {
    String res = isValidData(firstName, secondName, email, phoneNumber, password, confirmPassword);
    if(res == StringManager.success){
    }else{
      onFail(res);
    }
  }

  String isValidData(
      String firstName,
      String secondName,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword
      ){

    if(
      firstName.isEmpty ||
      secondName.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      confirmPassword.isEmpty
    ){
      return StringManager.fieldsCannotBeEmpty;
    }
    final emailRegax = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(!emailRegax.hasMatch(email)){
      return StringManager.emailNotValid;
    }
    if(password != confirmPassword){
      return StringManager.checkPassword;
    }
    return StringManager.success;
  }
}