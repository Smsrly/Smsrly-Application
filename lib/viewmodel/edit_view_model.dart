import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:smsrly/domain/repository/user_repository.dart';

import 'package:smsrly/domain/use_cases/user_use_cases/update_user_info/edit_profile_use_case.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/utils.dart';

class EditProfileViewModel with ChangeNotifier {
  UserRepository userRepository;
  late EditProfileUseCase _editProfileUseCase;

  bool _isLoading = false;

  get isLoading => _isLoading;

  EditProfileViewModel(this.userRepository) {
    _editProfileUseCase = EditProfileUseCase(userRepository);
  }

  Future<String?> updateUserInfo(
      String firstName,
      String secondName,
      String email,
      String phoneNumber,
      LatLng location,User user) async {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners();

      String? res = await _editProfileUseCase.updateUserInfo(
          firstName, secondName, email, phoneNumber, location);

      if (res != StringManager.userInfoUpdated) {
        _isLoading = false;
        notifyListeners();
        Utils.showToast("Error in updating user info: ${res.toString()}", 1);
        return null;
      }

      user.firstName = firstName;
      user.secondName = secondName;
      user.phoneNumber = phoneNumber;
      user.longitude = location.longitude;
      user.latitude = location.latitude;

      _isLoading = false;
      notifyListeners();
      Utils.showToast(StringManager.userInfoUpdated, 1);
      return null;
    }
    return null;
  }
}
