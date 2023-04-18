import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smsrly/domain/repository/user_repository.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/models/validator.dart';
import 'package:smsrly/res/strings.dart';

class EditProfileUseCase {
  final UserRepository repository;

  late ValidationService _validationService;

  EditProfileUseCase(this.repository) {
    _validationService = ValidationService();
  }

  Future<String?> updateUserInfo(String firstName, String secondName,
      String email, String phoneNumber, LatLng location) async {
    String valid = _isValidData(firstName, secondName, phoneNumber);
    if (valid != StringManager.success) {
      return valid;
    }

    final res = await repository.updateUserInfo(User(
        firstName: firstName,
        secondName: secondName,
        email: email,
        phoneNumber: phoneNumber,
        latitude: location.latitude,
        longitude: location.latitude));

    return res;
  }

  String _isValidData(String firstName, String secondName, String phoneNumber) {
    if (firstName.isEmpty || secondName.isEmpty || phoneNumber.isEmpty) {
      return StringManager.fieldsCannotBeEmpty;
    }
    if (!_validationService.isValidName(firstName)) {
      return StringManager.firstNameInvalid;
    }
    if (!_validationService.isValidName(secondName)) {
      return StringManager.secondNameInvalid;
    }
    if (!_validationService.isValidNumber(phoneNumber)) {
      return StringManager.phoneNumberInvalid;
    }
    return StringManager.success;
  }
}
