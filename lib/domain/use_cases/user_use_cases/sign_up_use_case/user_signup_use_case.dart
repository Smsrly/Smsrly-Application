import '../../../../res/strings.dart';
import '../../../repository/repository.dart';

class SignUpUseCase{
  final Repository repository;

  SignUpUseCase(this.repository);


  Future signUp(
      String firstName,
      String secondName,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword,
      ) async {

    firstName = firstName.trim();
    secondName = firstName.trim();
    email = email.trim();
    phoneNumber = phoneNumber.trim();

    String res = _isValidData(
        firstName,
        secondName,
        email,
        phoneNumber,
        password,
        confirmPassword);

    if(res != StringManager.success){
      return res;
    }

  }

  String _isValidData(
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
    if(!_isValidName(firstName)){
      return StringManager.firstNameInvalid;
    }
    if(!_isValidName(secondName)){
      return StringManager.secondNameInvalid;
    }
    final emailRegax = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(!emailRegax.hasMatch(email)){
      return StringManager.emailNotValid;
    }
    if(!_isValidPhoneNumber(phoneNumber)){
      return StringManager.phoneNumberInvalid;
    }
    if(password != confirmPassword){
      return StringManager.checkPassword;
    }
    if(!_isValidPassword(password)){
      return StringManager.passwordValidationMessage;
    }
    return StringManager.success;
  }

  bool _isValidPassword(String password) {
    // Password length should be between 8 and 20 characters
    if (password.length < 8 || password.length > 20) {
      return false;
    }

    // Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character
    RegExp pattern = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#^])[A-Za-z\d@$!%*?&#^]{8,20}$');
    bool isMatched = pattern.hasMatch(password);

    return isMatched;
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    if(phoneNumber[0] != '+'){
      return false;
    }

    if(phoneNumber.length<10){
      return false;
    }

    return true;
  }
  bool _isValidName(String name) {
    if(name.length<2 || name.length>20){
      return false;
    }

    RegExp pattern = RegExp(r'^[a-zA-Z]+$');

    bool isMatched = pattern.hasMatch(name);

    return isMatched;
  }

}