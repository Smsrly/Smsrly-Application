class ValidationService {

  bool isValidName(String name) {
    if (name.length < 2 || name.length > 20) {
      return false;
    }
    RegExp pattern = RegExp(r'^[a-zA-Z]+$');
    return pattern.hasMatch(name);
  }

  bool isValidEmail(String email) {
    if(email.isEmpty){
      return false;
    }
    final emailRegax = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return emailRegax.hasMatch(email);
  }

  bool isValidPassword(String password) {
    // Password length should be between 8 and 20 characters
    if (password.length < 8 || password.length > 20) {
      return false;
    }

    // Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character
    RegExp pattern = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#^])[A-Za-z\d@$!%*?&#^]{8,20}$');
    bool isMatched = pattern.hasMatch(password);

    return isMatched;
  }

  bool isValidNumber(String phoneNumber) {
    if (phoneNumber[0] != '+') {
      return false;
    }

    if (phoneNumber.length < 10) {
      return false;
    }

    return true;
  }

  bool isValidCode(String code) {
    return code.length == 4 && RegExp(r'^[0-9]+$').hasMatch(code);
  }

}
