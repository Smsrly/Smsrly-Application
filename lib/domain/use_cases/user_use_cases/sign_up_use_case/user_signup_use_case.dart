import 'dart:io';

import 'package:smsrly/models/user.dart';

import '../../../../models/validator.dart';
import '../../../../res/strings.dart';
import '../../../repository/user_repository.dart';

class SignUpUseCase{
  final UserRepository repository;
  late ValidationService _validationService;
  SignUpUseCase(this.repository){
    _validationService = ValidationService();
  }


  Future<String> signUp(
      String firstName,
      String secondName,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword,
      double? lat,
      double? long,
      File? image
      ) async {

    firstName = firstName.trim();
    secondName = secondName.trim();
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
    return await repository.signUp(
        User(
          firstName: firstName,
          secondName: secondName,
          email: email,
          phoneNumber: phoneNumber,
          latitude: lat,
          longitude: long,
        ),
        password,
        image
    );
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
    if(!_validationService.isValidName(firstName)){
      return StringManager.firstNameInvalid;
    }
    if(!_validationService.isValidName(secondName)){
      return StringManager.secondNameInvalid;
    }
    if(!_validationService.isValidEmail(email)){
      return StringManager.emailNotValid;
    }
    if(!_validationService.isValidNumber(phoneNumber)){
      return StringManager.phoneNumberInvalid;
    }
    if(password != confirmPassword){
      return StringManager.checkPassword;
    }
    if(!_validationService.isValidPassword(password)){
      return StringManager.passwordValidationMessage;
    }
    return StringManager.success;
  }

}